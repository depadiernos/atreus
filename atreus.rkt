#lang racket

(define cols 12)
(define rows 4)

(define x-offset 22)
(define y-offset 22)

(define spacing 18)
(define angle 10)

(define column-offsets '(15 5 0 6 11 65 65 11 6 0 5 15))

(define (switch-module x y rotation label net-pos net-neg)
  ;; TODO: set timestamps?
  `(module Keebio-Parts:MX-Alps-Choc-1U-NoLED (layer Front) (tedit 4FD81CDD) (tstamp 543EF801)
     (at ,x ,y ,rotation)
     (path /543DB910) ; TODO: this is not documented; no idea what it does
     (fp_text reference ,label (at 0 3.302 ,rotation) (layer F.SilkS)
              (effects (font (size 1.524 1.778) (thickness 0.254))))
     (fp_line (start -9.025 9.025) (end -9.025 -9.025) (layer Dwgs.User) (width 0.15))
     (fp_line (start 9.025 9.025) (end -9.025 9.025) (layer Dwgs.User) (width 0.15))
     (fp_line (start 9.025 -9.025) (end 9.025 9.025) (layer Dwgs.User) (width 0.15))
     (fp_line (start -9.025 -9.025) (end 9.025 -9.025) (layer Dwgs.User) (width 0.15))
     (fp_line (start -7 -7) (end -7 -5) (layer Dwgs.User) (width 0.15))
     (fp_line (start -5 -7) (end -7 -7) (layer Dwgs.User) (width 0.15))
     (fp_line (start -7 7) (end -5 7) (layer Dwgs.User) (width 0.15))
     (fp_line (start -7 5) (end -7 7) (layer Dwgs.User) (width 0.15))
     (fp_line (start 7 7) (end 7 5) (layer Dwgs.User) (width 0.15))
     (fp_line (start 5 7) (end 7 7) (layer Dwgs.User) (width 0.15))
     (fp_line (start 7 -7) (end 7 -5) (layer Dwgs.User) (width 0.15))
     (fp_line (start 5 -7) (end 7 -7) (layer Dwgs.User) (width 0.15))

     (pad "" np_thru_hole circle (at -5.5 0 ,(+ rotation 180)) (size 1.7 1.7) (drill 1.7) (layers *.Cu *.Mask))
     (pad "" np_thru_hole circle (at 0 0 ,(+ rotation 180)) (size 3.4 3.4) (drill 3.4) (layers *.Cu *.Mask))
     (pad "" np_thru_hole circle (at 5.5 0 ,(+ rotation 180)) (size 1.7 1.7) (drill 1.7) (layers *.Cu *.Mask))

     (pad 1 thru_hole circle (at 5 -3.8 ,rotation) (size 2 2) (drill 1.2) (layers *.Cu *.Mask) ,net-pos)
     (pad 2 thru_hole circle (at 0 -5.9 ,rotation) (size 2 2) (drill 1.2) (layers *.Cu *.Mask) ,net-neg)))

(define (diode-module x y rotation label net-pos net-neg)
  `(module DIODE (layer Front) (tedit 4E0F7A99) (tstamp 543EF854)
     (at ,x ,y ,(+ 90 rotation))
     (path /543DB90F)
     (attr smd)
     (fp_text reference ,label (at 6 0 ,rotation) (layer F.SilkS) hide (effects (font (size 1.016 1.016) (thickness 0.2032))))
     (fp_text value "" (at 0 0 80) (layer F.SilkS) (effects (font (size 1.27 1.27) (thickness 0.15))))

     (fp_line (start 0.9 1.1) (end 0.9 -1.1) (layer F.SilkS) (width 0.15))
     (fp_line (start 1.1 -1.1) (end 1.1 1.1) (layer F.SilkS) (width 0.15))
     (fp_line (start 1.3 -1) (end 1.3 -1.1) (layer F.SilkS) (width 0.15))
     (fp_line (start 1.3 -1.1) (end 1.3 -1) (layer F.SilkS) (width 0.15))
     (fp_line (start 1.3 1.1) (end 1.3 -1) (layer F.SilkS) (width 0.15))
     (fp_line (start -1.524 -1.143) (end 1.524 -1.143) (layer F.SilkS) (width 0.2032))
     (fp_line (start 1.524 -1.143) (end 1.524 1.143) (layer F.SilkS) (width 0.2032))
     (fp_line (start 1.524 1.143) (end -1.524 1.143) (layer F.SilkS) (width 0.2032))
     (fp_line (start -1.524 1.143) (end -1.524 -1.143) (layer F.SilkS) (width 0.2032))

     (pad 1 thru_hole rect (at 3.5 0 ,(+ 90 rotation)) (size 1.6 1.6) (drill 1) (layers *.Cu *.Mask F.SilkS) ,net-pos)
     (pad 2 thru_hole circle (at -3.5 0 ,(+ 90 rotation)) (size 1.6 1.6) (drill 1) (layers *.Cu *.Mask F.SilkS) ,net-neg)))

(define microcontroller-module
  `(module PROMICRO (layer Front) (tedit 4FDC31C8) (tstamp 543EF800)
     (at 134 48 270)
     (path /543EEB02)
     (fp_text reference Promicro (at 10 0) (layer F.SilkS) (effects (font (size 1 1) (thickness 0.15))))
     (fp_line (start -15.24 7.62) (end 15.9 7.62) (layer F.SilkS) (width 0.381))
     (fp_line (start 15.9 7.62) (end 15.9 -7.62) (layer F.SilkS) (width 0.381))
     (fp_line (start 15.9 -7.62) (end -15.24 -7.62) (layer F.SilkS) (width 0.381))
     (pad B5  thru_hole circle (at 13.97 -7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 4 N-row-3))
     (pad B4  thru_hole circle (at 11.43 -7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 3 N-row-2))
     (pad E6  thru_hole circle (at 8.89 -7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 11 N-col-6))
     (pad D7  thru_hole circle (at 6.35 -7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 12 N-col-7))
     (pad C6  thru_hole circle (at 3.81 -7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 13 N-col-8))
     (pad D4  thru_hole circle (at 1.27 -7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 14 N-col-9))
     (pad D0  thru_hole circle (at -1.27 -7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 15 N-col-10))
     (pad D1  thru_hole circle (at -3.81 -7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask))
     (pad GND thru_hole circle (at -6.35 -7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask))
     (pad GND thru_hole circle (at -8.89 -7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask))
     (pad RX1 thru_hole circle (at -11.43 -7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask))
     (pad TX0 thru_hole rect (at -13.97 -7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask))

     (pad B6  thru_hole circle (at 13.97 7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 10 N-col-5))
     (pad B2  thru_hole circle (at 11.43 7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 2 N-row-1))
     (pad B3  thru_hole circle (at 8.89 7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 9 N-col-4))
     (pad B1  thru_hole circle (at 6.35 7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 8 N-col-3))
     (pad F7  thru_hole circle (at 3.81 7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 7 N-col-2))
     (pad F6  thru_hole circle (at 1.27 7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 6 N-col-1))
     (pad F5  thru_hole circle (at -1.27 7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 5 N-col-0))
     (pad F4  thru_hole circle (at -3.81 7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask) (net 1 N-row-0))
     (pad VCC thru_hole circle (at -6.35 7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask))
     (pad RST thru_hole circle (at -8.89 7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask))
     (pad GND thru_hole circle (at -11.43 7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask))
     (pad RAW thru_hole circle (at -13.97 7.62 270) (size 1.7526 1.7526) (drill 1.0922) (layers *.Cu *.SilkS *.Mask))))

(define nets
  `((net 0 "")
    (net 1  N-row-0)
    (net 2  N-row-1)
    (net 3  N-row-2)
    (net 4  N-row-3)
    (net 5  N-col-0)
    (net 6  N-col-1)
    (net 7  N-col-2)
    (net 8  N-col-3)
    (net 9  N-col-4)
    (net 10 N-col-5)
    (net 11 N-col-6)
    (net 12 N-col-7)
    (net 13 N-col-8)
    (net 14 N-col-9)
    (net 15 N-col-10)
    ,@(for/list ([s (in-range 42)])
        (list 'net (+ 16 s) (string->symbol (format "N-diode-~s" s))))))

(define (net-class nets)
  (append '(net_class Default "This is the default net class."
                      (clearance 0.254)
                      (trace_width 0.2032)
                      (via_dia 0.889)
                      (via_drill 0.635)
                      (uvia_dia 0.508)
                      (uvia_drill 0.127))
          (for/list ([n nets])
            (list 'add_net (last n)))))

(define (switch row col)
  (let* ([left? (< col 6)]
         [rotation (if left? -10 10)]
         [x (* (+ 1 col) spacing)]
         [y (+ (list-ref column-offsets col) (* spacing row))]
         [hypotenuse (sqrt (+ (* x x) (* y y)))]
         [Θ (atan (/ y x))]
         [Θ′ (- Θ (degrees->radians rotation))]
         [x′ (+ (if left? x-offset 15.5) (* hypotenuse (cos Θ′)))]
         [y′ (+ (if left? y-offset (+ y-offset 40.60)) (* hypotenuse (sin Θ′)))]
         [label (format "SW~a:~a" col row)]
         [diode (+ row (* col 4))]
         ;; if we try to number nets linearly, kicad segfaults; woo!
         ;; so we re-use the nets we skipped with the missing col 5/6 diodes
         [diode (cond [(> diode 44) (- diode 20)]
                      [(> diode 41) (- diode 21)]
                      [true diode])]
         [net-col (if left? col (- col 1))]
         [diode-net `(net ,(+ 16 diode)
                          ,(string->symbol (format "N-diode-~s" diode)))]
         [column-net `(net ,(+ net-col 5)
                           ,(string->symbol (format "N-col-~s" net-col)))]
         ;; rotate middle keys additional 90° after calculating position
         [rotation (cond [(= 5 col) 80]
                         [(= 6 col) 280]
                         [true rotation])])
    (switch-module x′ y′ rotation label
                   (if left? diode-net column-net)
                   (if left? column-net diode-net))))

(define (diode row col)
  (let* ([left? (< col 6)]
         [rotation (if left? -10 10)]
         [x (* (+ 1 col) spacing)]
         [y (+ (list-ref column-offsets col) (* spacing row))]
         [hypotenuse (sqrt (+ (* x x) (* y y)))]
         [Θ (atan (/ y x))]
         [Θ′ (- Θ (degrees->radians rotation))]
         [x′ (+ (if left? x-offset 15.5) (* hypotenuse (cos Θ′)) (if left? 9 -9))]
         [y′ (+ (if left? y-offset (+ y-offset 40.60)) (* hypotenuse (sin Θ′)))]
         [label (format "D~a:~a" col row)]
         [diode (+ row (* col 4))]
         ;; if we try to number nets linearly, kicad segfaults; woo!
         ;; so we re-use the nets we skipped with the missing col 5/6 diodes
         [diode (cond [(> diode 44) (- diode 20)]
                      [(> diode 41) (- diode 21)]
                      [true diode])]
         [net-row (cond [(= col 5) 2]
                        [(= col 6) 3]
                        [true row])])
    (diode-module x′ y′ rotation label
                  `(net ,(+ 16 diode)
                        ,(string->symbol (format "N-diode-~s" diode)))
                  `(net ,(+ net-row 1)
                        ,(string->symbol (format "N-row-~s" net-row))))))

(define switches+diodes
  (for/list ([col (in-range cols)]
             #:when true
             [row (if (or (= 5 col) (= 6 col))
                      '(0) (in-range rows))])
    (list (switch row col) (diode row col))))

(define edge-cuts
  (for/list [(s '([31 22] [84 22]  [141 30] [127 30] [185 22] [237 22]  [251 100] [161 112] [107 112] [17 100]))
             (e '([84 22] [127 30] [185 22] [141 30] [237 22] [251 100] [161 112] [107 112] [17  100] [31 22]))]
    `(gr_line (start ,@s) (end ,@e) (angle 90) (layer Edge.Cuts) (width 0.3))))

(define board
  (apply append nets
         (list (net-class nets))
         (list microcontroller-module)
         edge-cuts
         switches+diodes))

(define (write-placement filename)
  (when (file-exists? filename) (delete-file filename))
  (call-with-output-file filename
    (λ (op)
      (display (call-with-input-file "header.rktd"
                 (curry read-string 9999)) op)
      ;; kicad has this terrible bug where it's whitespace-sensitive here =(
      (display "\n" op)
      (for ([f board])
        (pretty-print f op 1))
      (display (call-with-input-file "traces.rktd"
                 (curry read-string 999999)) op)
      (display ")" op))))

(write-placement "atreus.kicad_pcb")

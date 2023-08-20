Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E5A781ED2
	for <lists+uboot-stm32@lfdr.de>; Sun, 20 Aug 2023 18:24:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59C60C6B44F;
	Sun, 20 Aug 2023 16:24:53 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C4B6C6B444
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Aug 2023 16:24:52 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-99bfcf4c814so338083666b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Aug 2023 09:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692548692; x=1693153492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=54yeXOSMx1sO1f4/Nd8Z0B/D+/tyVaDPmB7TdnnU670=;
 b=fir6d89jgUslcIZrms8UNb2SBMypzhI+MjlN9Pw1dAm5a+kJMObs9OFaTgteB/UPNX
 O675spkiAq8rX6H60atVwUwVgPnYlsbjiQL+q2wweugZPIf6TtsqFPJFxuwJDgI+Hr18
 2nhpDgvZpVbJ/LmDCRvCFyaqcm5bkczLc7cQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692548692; x=1693153492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=54yeXOSMx1sO1f4/Nd8Z0B/D+/tyVaDPmB7TdnnU670=;
 b=k7pRLU0nXdGf7xT1CsyuWCdBXyWqfOP7lvacMgMVKMjlJ3rMr1E4qAkzXvcS13JS2E
 BGNoMF6fKEisXXrqr9ID7BzU0H9Bx73qe48UGxx9To8mbVkP67cgE/L08xhGzRcFARMz
 jxPGg7Y6CZlmW+YKVzGFdMh2FvORQsTQQQ+sNLM/QHORimUGQuI1RPJnVIGCwsEMtqeb
 v9Kw4jFS5UxKC4vxDJG1grdso1Kh/fxSoI9iacabGZDIcQ70EATA7+0dNImwf1gt+xBJ
 /nSpnVbHxANJ+1UbLAQOwRwiC1EHp0AXeI5IYU13WvEzJ9vU3PVBHWS+dSojip/h2hBZ
 4WNw==
X-Gm-Message-State: AOJu0YwxP1u48h6sRq9Tqo5WHzWpCz3oIlszo1gQlK4xEPK2iayy1brf
 9ZYJhObPevBVnMgZTjpt/pY+Uw==
X-Google-Smtp-Source: AGHT+IHy8sSS1EM7/of0bcSxkZINfAp2m068NPOkxXXXH8uOiSN9W2Eie5QP6uqzOilEE4EPVBkETg==
X-Received: by 2002:a17:907:77cb:b0:99b:4668:865f with SMTP id
 kz11-20020a17090777cb00b0099b4668865fmr3811393ejc.10.1692548691758; 
 Sun, 20 Aug 2023 09:24:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-180-23-204.pool80180.interbusiness.it. [80.180.23.204])
 by smtp.gmail.com with ESMTPSA id
 sd20-20020a170906ce3400b0096f6a131b9fsm4844859ejb.23.2023.08.20.09.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 09:24:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun, 20 Aug 2023 18:24:45 +0200
Message-Id: <20230820162446.616442-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230820162446.616442-1-dario.binacchi@amarulasolutions.com>
References: <20230820162446.616442-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Vikas Manocha <vikas.manocha@st.com>,
 yannick fertre <yannick.fertre@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 2/3] board: stm32f746-disco: refactor the
	display of the ST logo
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

The patch removes the legacy mode of displaying the ST logo and adopts
the approach introduced by the commit 284b08fb51b6 ("board: stm32mp1: add
splash screen with stmicroelectronics logo"). It was necessary to use a
specific logo for the stm32f746-disco board.

Furthermore, the previous version didn't properly center the logo, hiding
its upper part.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 board/st/stm32f746-disco/stm32f746-disco.c |   6 ------
 configs/stm32f746-disco_defconfig          |   2 +-
 configs/stm32f746-disco_spl_defconfig      |   2 +-
 include/configs/stm32f746-disco.h          |   7 ++++++-
 tools/logos/stm32f746-disco.bmp            | Bin 0 -> 18052 bytes
 5 files changed, 8 insertions(+), 9 deletions(-)
 create mode 100644 tools/logos/stm32f746-disco.bmp

diff --git a/board/st/stm32f746-disco/stm32f746-disco.c b/board/st/stm32f746-disco/stm32f746-disco.c
index 4cfb29ef428b..0f9666008430 100644
--- a/board/st/stm32f746-disco/stm32f746-disco.c
+++ b/board/st/stm32f746-disco/stm32f746-disco.c
@@ -14,7 +14,6 @@
 #include <serial.h>
 #include <spl.h>
 #include <splash.h>
-#include <st_logo_data.h>
 #include <video.h>
 #include <asm/global_data.h>
 #include <asm/io.h>
@@ -134,10 +133,5 @@ int board_init(void)
 	}
 #endif
 
-#if defined(CONFIG_CMD_BMP)
-	bmp_display((ulong)stmicroelectronics_uboot_logo_8bit_rle,
-		    BMP_ALIGN_CENTER, BMP_ALIGN_CENTER);
-#endif /* CONFIG_CMD_BMP */
-
 	return 0;
 }
diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
index 8403679d7fa6..2ca4aaf96eb6 100644
--- a/configs/stm32f746-disco_defconfig
+++ b/configs/stm32f746-disco_defconfig
@@ -56,13 +56,13 @@ CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_MAX_XRES=480
 CONFIG_VIDEO_STM32_MAX_YRES=272
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
-CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_BMP_16BPP=y
 CONFIG_BMP_24BPP=y
 CONFIG_BMP_32BPP=y
diff --git a/configs/stm32f746-disco_spl_defconfig b/configs/stm32f746-disco_spl_defconfig
index 50c2a36784af..b0afe42433a4 100644
--- a/configs/stm32f746-disco_spl_defconfig
+++ b/configs/stm32f746-disco_spl_defconfig
@@ -82,13 +82,13 @@ CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_SPL_TIMER=y
 CONFIG_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_MAX_XRES=480
 CONFIG_VIDEO_STM32_MAX_YRES=272
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
-CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_BMP_16BPP=y
 CONFIG_BMP_24BPP=y
 CONFIG_BMP_32BPP=y
diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
index 9bf01cac47a4..00ec9efba577 100644
--- a/include/configs/stm32f746-disco.h
+++ b/include/configs/stm32f746-disco.h
@@ -23,6 +23,10 @@
 #define BOOT_TARGET_DEVICES(func) \
 	func(MMC, mmc, 0)
 
+#define STM32F746_BOARD_EXTRA_ENV \
+	"splashimage=0xC0448000\0" \
+	"splashpos=m,m\0"
+
 #include <config_distro_bootcmd.h>
 #define CFG_EXTRA_ENV_SETTINGS				\
 			"kernel_addr_r=0xC0008000\0"		\
@@ -31,7 +35,8 @@
 			"scriptaddr=0xC0418000\0"		\
 			"pxefile_addr_r=0xC0428000\0" \
 			"ramdisk_addr_r=0xC0438000\0"		\
-			BOOTENV
+			BOOTENV	\
+			STM32F746_BOARD_EXTRA_ENV
 
 #define CFG_SYS_UBOOT_BASE		(CFG_SYS_FLASH_BASE + \
 					 CONFIG_SPL_PAD_TO)
diff --git a/tools/logos/stm32f746-disco.bmp b/tools/logos/stm32f746-disco.bmp
new file mode 100644
index 0000000000000000000000000000000000000000..c1ef4fb035c0833ea22aaa7d8aef1f0f4129d7fa
GIT binary patch
literal 18052
zcmchf2Y8iL*6;T^5poi8NK8n81VT+AV1$GgNFV_r0)~)KrH0;nZ_;~}-g_6RN*9q{
zRg^AB2SLR$ws8vgxAr+O=yhg3yw7)i29kI0wbowyzv|xa%T!4lUESFKCca?I5PrKM
z#su(3jFUgc{F-9SybA6=c0dQs<0t>K4^>h#drv#~V|2!@@Zj(<UrKy@d{Db~?IQV;
zeg6FUK1se8y`q~=i&Nq!|FPU}{(JoRv6(hzg!$(`|7pJe?mM&R-R)*{|K8@(h4ZFn
zxH13u$3IM+;(5$#g|nOeyLXvie)-w_`s=TzeP%85kH7!j)Q$=;m(HIzfBW0t%nyJ0
zi}~wc|7!m7{r4s#Hrx#A)Ye?TcFpu|)zs9DD{TJy%P;2c?b~MK>XqhK=(;wkXC6NI
z!u;^V4`#)}dFJ!0pPA1tUox#~rkF=xe{FiUXk@<q<{R_#Pd}M&_<8lp71O_6OLOtu
zr>1_HD6@ahF4LuPrdc*`j%iUX(fs`L&t_=1j^@jU56!@iZOoPp>&yr5?K6!MW6jrJ
zerdjW^vJZUlWP9{_rIBsPoFZY7cVqt&z$D@@8;{TzA}quPB$ly9x*pQzh-)6H8yQ(
zS2JfnJYzPjTy8qlOEX!imCUh22f^SMvuWKL)B3fl=GteUnWiaaSo<gQ$wwcWzHM5V
z<A)EK@4o%UG$>!(Jow@ZGk3~FGo)(=vv21P)2V*Cd2iQFbLG-Svu)!B^Amgf?%Qw8
zq4)QjPe1<1Oc*-Q4C~p&{0JuBefO<7bMl1QyW?GR`Qin0^xy|(K>Jo^)uIKaaiuu0
zy=rdXx@qp-xor*~*l$i9J8GI$Esy@6o7t1bn>)8|nT0c^neV^<&YV7R+;nbO$9x4g
zKmGWl88fi288^7Ud82!0)2DSa^Tqvp=KkHgX8YT3nFsgpo9@jTfcIsy=bi0l>Zsx7
z&h1-f?XtyY#e%u!$Oi|^^7(Vv+kLZc*%I^Nsgvg7`E%wgFn)LQCbN3UB6IHS$7WQ&
zUgp+~>*m6zpP0d&+nIMZzirm9SZ3BNU1Y`&8DLI;^^fSXjWwr_9ck{}y<=|QykQ<;
zixWo<o151^H;ZPyY2M$n+iY69+8kxww^pq%XV}Z+;X}>5sgv-Tt7hq(S!ThTQ_bn)
z$IOl`o6O?bGr;T}Z1sWJuxh!PF@Cf;uy>D{KYfZhxPPD7ynZcsy>GU@wcbp8V-WhE
zF!%1<F_VT3!FL{*nG?pa_I37f*36qW*}To#Z;l&f4()#rdtWgt7tS{q@WK1{?wa$T
zoHbwEy9du$^TEEoX3EH6=J=6AX4b@UX6fA7X3pdZ<~;j9uy2pqv30W<-n*+gb^NH=
zxMr0Z(Wko^JE)&oGJB@kwQZ|ew|uGD{mwS?F+O<<9NyWqk@$FECXaZ-jO^PJzu93f
zU$|g)ZQp8kZrfr$!iWD~|9fn1BI1Ah@0&*aB~6w|uvbg*l0xDqfj_YB4I_avMyALl
z874WUrliUUxhSWkuVns(`Ol3wrMWzk%`#l#vUy9a<d#cPPCl04@0h=4kaSwMiI2lu
z8cG3KfSl_RC2?NfvO)$)(6?@?m!z@yh_?htgba|5(n0RYi}IyRml05wl_rw*4U|`n
zw3bhhRZFHy5m_w*WvIAVW1z&yQCSG>RdjPbg7%6LhqRZeP{+z`IqG9%q%2|=-V!1w
zq><9hQyOO}`?om!3<zwOdY0mdtj%GNIspCzsawW494XL+^7C~!XCaA{uwcXbfq9Jt
z%S;JELK%4gM<}QyWrLnS{!(9VFg8UTrBz~9vXK-ChQ}q*;-%8kjGUDY*<Y1pxhvJA
zy~9Wq`9P8xxht3DAX)}WLC0O5KVUvn9NwyPOE6d}Upiip@nF_Vj!7eNqP6aOyKIoI
zSfaC>b*U9cg4{m2Bk#!j(n4O4w`7J?U>!fk-<Iq$M3O+L5l`i1hwOqkzkDXI$rkkm
zsem3GWS+z$+eiaedmq{R9RBFtT0WIWj#*IWkT+!&G)7j+Y<B!e2C{-b9`zEoei4kE
z)(Z3GRq$!)tEeTjqoP>SX?N5>>c|>t#(t(_qbBmQd?Ta8LCtky;~7YK32FXt`m@Im
zpGbW{_gqZ!u#;EOH4r;gfbuOQwUCYMx*6!t$6ii<!&;qK<4g2k#6B0w6|_DpfoQr4
z)aptPDU{~6$y-v>(O615+Dd8sx{JIgeW99zALqtjb$mD;-9^rUfD@}+lM+0YW>jZN
zLsNiNST(yryB@M%)=4^1;wx{+ENnN>;t|C9CGp%ic3nsuAQUJSL2I-;%&wkv4jig6
z775p2q9a-Sz-p+h1#zWFAR>=}_;z$Dz*vm6k<wQLqhNgOMYOmMWj*3Jnb9D58SC7Z
zp6td&q+O6iB6y;>Si3%Pc~wfuS}^X(4#vu4kPBo7e(a!?RF!ljl>m$4NKRth#rP#8
z^aDQ^T;cf15uT4rK5=0gCy2i%O_ADKvRJ{vE|0RO2NDYwp>hc8bVpBzwQ3N0<bXfI
z>ia%^(hh%mfw;Yn*G=<SX8a3^VgRVUD@EDG_NUKH<vuG8l~29Ay?mM9Du=~M6lQ|{
z4b3o4Z!*nbJgWk_G?z9K0`CEA;KIw2*vnRQ^6^p43gGj7!Pgsm)|X=JHA~Kuy+W;w
zL_D+xIL^k`oa{4@IK3bl4qs;D<Rs|aWp*=Ot1**{JU9YLx!G$tD>p%U0NJo8yY36!
z0ph@go=$xFkm`vBvGTc0WYt_mVHd_q5FNRo50i0{m*>WKd^junOF=wKvuAH<hwNzL
zwx0N)hcBZeh=KNSRRGt)65{Jk9^VDtx0wrJg?t`N>!Ryaa&>968BY9fCC`5ZwsmAL
z<5guY<9X!_-j<)JbfU#e&`d_#K1d2ho2htbE3$*4aTuQ~4gR~y4ZVoIJ@`~jBn)Q7
zc{YE&f`tb|m5Dd|VTmJ>z<e!vUA`t$O(CZ4%O(k7Y?xf)?*+0`idlr3Nf(|&nB9Sn
zQ=q;tZ5e4Q1^Bxwnb_&2_Q;M;W-wBV9o!;6?w9rG-k6aDsV(dHc?sWE>xALWQS71w
zNUL>rAj@0kN^@|_1Klt(i~4e;ESHD2nzcoeN-U4$t#)S-VDX|jpvpyTtF5bJbGN;U
zVr_41i0wW0+J@AnQV5@$hkfdS)Jb+x9+^{!mNpW~d=wcf9~2eH1x<Ml0PEW9VLvE0
zVKv=tQ&1nl&y6zCW5-DL(w!_dozWW7A6>>sJM7q!@jUFeh4qSUtlOP9tit~N$r(k+
z13B2gucXRiX12&Q_Td1>LgZ0J@j6<3NSz2Ke-y&Xb+Bnas=7D!-zBTD;uI{JE|n#V
z-%m?bcp~trj@Y3Bxvr43$4~2$aVLlmF;^NdEe0AIHxHpLK+bOs!YY3tm1sM$9S2=y
zjW6_fB1ch+Aj-bPUxqk>@brB03KZ3?7IDnJj#s+lt+<VmvWhtt?I<PL+Z#6CszKL=
z*mkiyKO(y!&n5AjS0o=Yz3`vnpnSnbeh5B&P*R{&tCnD$de20m`b_R;qOdB@zQ`#A
z0$x<$2qfpm<Bzd(FN@nKD(OO5LcFL4w~#W#cLOR^Nhlu@4Rxt^(NG4Hr?=qQ>!c|d
z_~30ePU{%v_CR}zJrx6^0OY*K@6FkpFBrazzq~307(RQR@gDMtjn9Vcvps9QEg@vx
z>eQcjV#&eU`JoNLi@vZ?nMB4rAeuR!*e3>`ugNNL{G7?YDuPHK=B-_b9S0*9cs?U*
zSvwNjgrf2D+M$x|n>0Ik*_haEwT=bDk<W`gyIdy8<Q9#XoOoF~v`&&rvYVZz6G4G^
zT|1uDcLVT}y5h&0Ww1sD`*;@XU|A2(K5!gLb^jOE*(}yMSjmB<rXt4|k4lz6C{u`$
z&2SZvW6ZCTi{O2dNYj4MpO{&|+<j>Lp>^TERiD9nq-3*w@LZ{YM*hU$k!O&`^46zA
ziNv0^cZg(UFci;)HnEgu`{D?yAa$3OlE~Lv?aGPN9|siA<?ZY<AO5Btd>4BEAa>@D
zNA9*>euMm@@$;3<(Ff@E++9EgGQ2NXJd3xN?M%wU-;P?Qc-Q9lPN1T`-Hdg#Uv12I
z96g-&+w<|tMP!aV%w-Xo8?i%U;%h2aO=HXpE!4l4$QJtGK}4fUed60|r5jHr>1G4T
z^k3UNr+%#&q$lyH_46Sy<e;mLq&BL)&xJK|(#S}qkrT=)jnMdGnShi@8gI-#7tVN4
zn4E{ZIyq!0I;9coiOBY$cZ{)CYr<?^vYm^S#!w+O&paQ((dd>AS2l?OF@Ityk}468
zmmH=`T8~{0+rBTHe5m=aBt20uloik+gy$#N&OnoM)FJH&>)PmcBby?1nHh`S!r<y<
z`;F(tG=^-gI+m1t$jGFUmc{eR$=W}K={%W)Mw6{9Kl-_{_|OKbfJXN!natdD>CZZT
z)Lr$x=fkrCeS~HMGH$3!Orhc>*<2e#{Ap%gfG;?auQ3zLvqg}IDI~A4_BM1#0mIW$
zil@rhLUXX%`4eheAbcOmE}otj!^3ps8W|TPC?|S3T;k7~&+CuL)|;Dfu1X=B1&Tjj
z=%hb9heo}T>jcN+tn+-B6{O00<Jo(ufW7_d<6&#C@p*b=EF5Uai?eNgI4PN|T+r74
z#@bJ?gJ5}!wJ$R21hs>*fhRX=E9G;3uOTk<a>*5be_qVa+EsJX%Vw7zetD>ss~kPi
zY0RJUyZvM%?L|l9T`FrLIcFl)jz*e4F|0j)Jt@u(9qjjcF&twvT_`A4ml3YKbfjJQ
za{!<72f=*Yql6+g3F$G!srD&u{DP!2$V{a|DSoSE{8Rky$zpyV9bn|zpTKS<JgIcB
z7p1GKu$*yprH|-{e>}g>?Xh_$l|FKDP9%{F3ftZr52l8v<7+Eq6<XGKZp@}>-~FOy
z`N7m^#i<9__@H+=2?VKV`Y|8!!?Q@0qH|EBf~6IFZcpoByYKhWp~Ig*YLxhdc$2&R
z{{%Ll$_RKrr4~BbK_Wh|Nsgk&qUXk<Am=9SmnPsP8~ti<+TCkUMN8;9ogmYb?q9Rj
zHj7L}TjLh|S7h$lo1yp6sP}(G#(g?|+O30z`cMM3qpU3O(>s{463fWR-yy{r4ts>t
z4d}VRp1A4w^pyOxKc|wew_cRM-=&eY0GWgBscSzqR{bcI>OWViq3N#Y#;%I!T|<Q2
z<Rmf1uRo`meKvC(C&Mdtji@MbPz<yA>!3yYN!EAA-yeC^G<l!h7Um@9AnWI{z3Km*
z!MGEkXKDgAy7w1BVl7-t^t=OtV{FCAz^m6#o4?6Xi4IErL_6WGzlp}Y<hXdam(g+Q
z>2(1;te$~?k7Iqgiu|rJ$FCA~{%s<lI?u_h<<D6_Z&M?r6S0$N`{d`V1MTV7RX33a
z<m^|FJ4x>YK`@%LvewSrJo|%2G0s)m>-={VgKT}+L?7mYFQ1Ln-=o+?&v>9Xo({uX
zG9(!swy=5|y`^DitErl?AohtALa*$$7tyZk*=$x4ga^VGgQw{phHFLo1N=JKlX4T}
zI5>fqh0>SKN-JkwS;3lXthHTq!JC+SKKwF4WjI_B*f5@saGbsMC@;<+t$=-Pg-N9o
ziv)>#WK!+m|1*N_-ncn>4JIR`!FNT<^7MNI^RnVl5IkWcbSJ+BN-}ik7!PE3!FZ^4
zk2%pv?`yMu=gsc3b_D!G!0-$Ddd)_2B^QzVdk?HAUnBXr6h)gXvVp#9I6_yXh#t0g
zbd_Z-b3>^J>NC%Wp@TETHn@E8!uj;vRft_ZIX;l0-2Mm41=fy|%j_YDd!uxFX83Oy
zs-H|F`t>X_oD-3rJ{)-RCx393OXohQBHeeeY-V<r1oQhBvXE8RaqFu!!o^+A0VIVG
zd->2~y9{IYGYO^_d(zK^uuc(H>11<aD3p3D`WqxUE!DMm9;sx!LhQ61H*R{0)-$xq
za`H2S=LoW6IP)&<yGpRqALE(HY3s=euIMwj6P>NUl;YMTNF1!0MkQ%t?UKmbiUwfn
zWL>>&T+9tfCZ6L(=Qo$V|4&e*XC^1Ov)MR%r|YB#EGH3vfNTgAq$qa-ne00^^Sk+}
zH{A{p)HgP@#gBe64Q{>R>_axFC@G+yMpvMbnOi=5(lNum!&<4L%wpyS-KyUD53%>M
zzR1(t<AU^!>Nz7gN73UUDU3X+*>g93s&|(Cp-{|n^VWwf4@Ec@D~0qw#(0_MRzgq7
z%{`~&9B>u0y@)UO);q~ndM8;7Yn-#P6R6v(bL-kWkb9kb5PhG}fU`}_7ybtr;|G3N
z#s{tK?J2x#WfFHBzsUedZXu1>b3Qu0hR9t(&GSbOCn)TNH$htAe|hKwwJYpOG^9Ws
z#=aNWQ)DeNZO}95Hl<4rf+CnxbWM1s^F~YGt~rSXcUA8#%a~81gVx*OKKPX0NrrR6
zyw39h?OIshMYPr8xh7e;3iD3#(Mk0C1ALJd32Ik(XSUZyb#2xQBi6oT?2PS&`mnE;
z$@|CDmyuo&U(s90F4Tw5nOTn(%gIb-EnbV!IVF!F&h<><Bg5%hdvS(~fqOOfYeJsU
zdKrs$zWn^J{tiApWf8I(5?>p+;akhiX%JbV1L#k%88gb>693*dIk}g;!p(LJwd-pr
z^&LmLWJ6LMcI?IbrYhL$G(K@s`Y^g&8nJhO;(ZBE5!iGVo_iE8u0V&g6l*kQJdstS
zLBZx6FfCx;Ary6tWN-WEh4j9<EitC|OPQ>(-|;0erqSvP!jC}fW#06>f>h0FVN|}h
za1=nJTdZ7$h?qt+oB}niIO*I=hhd{2b`r&Nb^Q81Recmzt3dtUNw%L0%6dnxw>*Dr
z;XHV86tcP@AwPQzB7dZk@ggi|0Gv%hrv?($djfe=xPvah2mc;SZ;)s^Mqi>Rzii=j
zABguYwr}%F(5KyDKeO=8oKP3G8M_NQXJNG<_O9=)h<b8zu$1R%vgf^p17yxf6g+Lo
z(oN_I^3%QPdk}8Gq%uE0dHU93oV_>J+xhCO@HIFcw|CCzX#6I*M}4ueu8m)AmE1ff
zkZbPQ+_a3yKW<|oj#{=DZ5KlGkafG@@pM_%l65S$_3XQuvUCr;H<7Z?TqP&BWG5{(
zzVNiBl4>h`AFvy2F<U`4b75)C-n?aF?OJ%<Xz(kCpO-+!8|){N7}Oi&^>Uq&1orkh
zm1`k+urbfsKycW<wcTktq6~6cto7d(ST7jw(A@81Z|VYUM>tu}XZT49{q7O8OOS?M
zq3~p&@d|vmeSYQp3@_*=A=%XzL(p^>xv3%)s>4!yuMosO^t@A9?S$2WcvGYIU5khn
zt)&gvTVp6xh7U7(A2rn8bydZCpWO8=fFmc_p@hAMcdx};9{jy0SrCok4kZc)&==|Z
z*doMMO?35PJcO)PmQ`ceO*r~#XBUNsy^h3KJMV+GpV}@x8btN<6AG7}XMNbS?q!~R
z>yeA7-L2j$0r180a}#lw#I7<yX$kS*o>81`U}1lJ@ZUvH889C$<s2>O8s>mQJbB|i
zM)umSw;R%0(8Ub`WBqEug~#+{tyvEJf?y$-<{|(2i32M*i1|@uimg(edNQ0|{}p0c
zk)DM=?;$SqjZGRH@3U41m59cEU{sFhO3-OVaIl9_<idVZiyV{yI_1fWLy<F)UDU>!
zWAMsAYI758*NpB!--)%w+cb;5M=p=1DrmNA!22%Vt|4VO5t)oG+NTAwP7l!CD><22
zK;&G*!}ulxt0dtY&3Logggh}5?!}fn13zoUuG7$NDD`JNtCYjqBe2T~@^%aMlb`)X
zN{Y=fLHG-A$&emG2AfV!<4Y6zE&U3lJ@rc859(X%vPAYZYKr#L|K_d(o&0PrALE!t
zN8Az({Lz05W1Vg0Z3-gO$n`N2$O;4b%47@@3$jj15k0#c#UIu{JB2^JxyjBaUKYJZ
zU_6r>O6^+w`8fvZZW(U*AAzF24QY>cDoK6ETjb*p=;vZ21^#7Fk0ib_`Q3p<%TTkb
zAg36*%wWA<mijAD%tT|YxyM-jE#7=?M~79i%$}Aa@q|~AydP`N$GX9+r_zQXZKg#f
zp3!4id<wj;krDNq1$Qn8Cim(dF4NU(%-_Mg3bOiHGCl7-!7YsEad==ac&Bi#eUZKU
zaT}0@=FNHDX{BC6!YaO-`nNYMbXvv9Ccfmv9JloJ@UC6&ZSgDfpLkB=8Duf3eN*xM
z*Ud${Kj6wGz3?P`Yto3Q*pGG%?C;BoV(mp+i~sfCN-6YvDQT)%Cp3N4-p{D4V`PYW
zRQ`$lUJM`9lRzwJeZ&4^#L2f<&+7F@5^s@PR8j}~-t>(0C3-4SKWY(cbIDU_9vK5H
zBCm+b(617nR%)~wjf`f<7-Y|?lcgFm{E3IrwzhR6M`T$kW9)ZfJ0%Dig+XJntn$1M
z|Cr8Wv11Y=H{~lN)g^jzl95(%QW}X@=O<HarYiX%$4SiVS2~mM+B76xBM;xk){!1r
z?PSOcRq!u8+0G-5^P^V<d~qQC#${P6fqe0%F<J&Ri-{8n!S?rHad{*-vODcJKK^9F
zT+lkLC#R4()J6^mvt>O$Yn%W5FaQ4YmxbpQ5tqbA`H|nkiyC4#-sMMzPm`o|XvcgE
zw+NRVGa_Cj0*kWqFi9z(Tot97V}|QRqO}tg(T+mIjUTd7mcw^WDe6-heCV?hBXUw_
zYm&|0k%QrC-68Zs4J9#WPAZ6gbyyNVTtdDakMH%Auw`xu4!nI3qjANw!^=-b3CyR}
zp{|tX1~dYnYlHO`kymFx8NLXv3z{DqA!mXlMk~!MiH1kt9}N$4-x|y!T1L{dB+ZBZ
zvR38gk`8U6^o7zz#+i^$^M&T-wq%W!5;)IInL-cG+Ys@M@@8*AP=`y60_x3CczZcG
z{pUdWnd;b@{w6(A-%=Ez?(LKkg|zc7j2>sjH47^IXd-({jnF=~JTymTdQt5?)=I9K
z%=6`CG<BdU^RqRlg=xMz4@D^5SQDu@0~-9PAa!IgqX&p)7aH|N=MbK|P;sig3C#_?
z5iBR^Mf60pQHDYjO&?hkxgqG-Lvl@niX2oC?INHWE0NIT!rybFzb}%COW;&DjRQ2+
ziEm-OF}o(g(6y5lV7CdI_)mf6wnm>YAB$z~v8y{$o%thJC~dNPK8$FK01aR8NJfH#
ztUDVEmqvHjBxvsFsd}_TAZ3=cgd$M(FyD|~w!ddS1*<J#zMs6r8prUS09I)z_od)O
zB-}H2S^?H5iG(C1e8kQhBBKEMxF$ex*X<{hka0-7pa|of6c?jei+i;3P~6wtP*MU4
zYUiCS%b=+UZ2(eYS+|OZMkR+r6Gu-|1{yzBu8y1#?&Z?Px#a}vi4<)zq#6|Zbh5ZN
z9pZ~R|Aj`_3W;U@ltna2@|VyrD;;Cqv+-D4y=SvzXRoiw2zdL^dHauX&j(W1b~DfI
z1@i}`HuGcYII?v9fm-qmyDX)>6h7pVWTcmn!#exW(0!{dva#!2=$220ix1j&W1WGc
z-4vJQ2o#BU;Xo*~2W|>QEczVvP~?-(S)raZVm^)9bQKMJBw1%$>V6AJ`_^94Ug8UB
z9_<Bf2320YCrh@W4OSinZ40swc|RGQnzhbBm(`0})q`HfNzS+omk+*IjXma&ysR)m
zl096(aFlGXr-DtyS0vQ)p!UTd&O^=n2&lW!KlzVzuM&xGcI%-2(udJ9;*TcN;B5$3
z3+*w%$zNKb*(Pk`7~$rM=8bXFPI@YQLE_;khy}aBv70W?$#W;_R{+T5C5J8Z@c5A(
zuXffxt^yQg&_522oScBd?DKN#bA8aKpmJns9X<kmEvj)mTC`_pV~NSOHYQ!vtikNX
zSBfe%*b>KR)D6srLOqbqx;oT@!L1$gz2p#kxFYR`yQz!IR!jYoghB14r)sGC;2YDR
zc43F=NWUaAJoNE$3i=3HWo1E4UI~%xJf+}sd!Y@HTT0u?&^vLXfek|GA7Y?rK)o$M
zj(Nf6-!NH@CKvU_>kT*kG;&`C^j)aWY0yWK$2AxBllj<e5I1PPV401b<nnN25$9v!
zSWFx$-i^4qNPr`!+_8Rt!lEBRKi^(CS{wW>TWipA=o{f4c*RJvWGp#tfMmiSh;0Jc
zLrv-Fp-&>;)@-Txs(&vgBL~9OQ&OY!d{Ea~y%BjzH4CMO9XQmzP6}VXe9}sJs^YKy
zRL7!ZqgwQV6<H^k>^m3^{mv|pa<tKGGaCBYP&=UJeGpltsq}zaZQKT|>MLbiLq|()
zYp(g_6!&0(1@(R9E~rDvPKBTkm)TI~2S3MPH^)T!8J}jFwcZi0!YUyftG{dOP%Ej&
zjt?>B^iUU~ck9+vBl3|fD`L1`P#^Y@Jz!c*Dnp&l$;+kG?etc<OB3D6Thai@4zhn&
zR==%w#iP<>3QuoHOAmDrC!56AHQP|HknJK;4nQ%1PC_er9k2{xwWjD0G|0Vz-VeUf
zP-D3?8K4~<Nf5nSB3y%sKaIPJoa9sC>V~KGRIc`l!p#QCQ-Zj0MrfqvjMa>!o|s0y
z)ts3jA1ZYR!)Y<9zJB%dl4L^LfIJfmbuGP*gg)3t&3XwQ=%(&2h3hG1Ys5d&P{(eF
z57Y@Dnh$CxD33+@CHc@pA0)jp)jkX4%_yx0pOsXPijZTLy1z_@+E+Fxbw|Y@N_^AR
zz8Cr34~{9)HqM(4MypbwG-2ocu&%Sen|?L*CZe{|SEgPjp^<}=(C&D>Gx`{tz3RzA
zZOI9K9-eq=TiG<#d9u`r*7|=%65)uzGc}U9VU$o1O+{vm@^sQ%^58YaxRk6cX0Th$
zGTubC;**B;64*l@>F%LTQVder6_J*~IXa*Cvr2Z^TUO({wG@MEroIb-tGvYYbFbiF
zzg25!zT7Cqp?8Sho(I6A|Mp`DJXzH9vFH`R3BRavb+(ASsua9OK(7Ys8|C%+H1sZN
z&pFoUCR3EUi}oUXgI!HMu$QGTgQhtvc=M#SEKnwaZVm8o^l{T4#A9P$QLS@GH1hd2
zLZT{a#wZH5oo#+xLi7ZB=!<c7POqx#w~}b~;Lko=NK~TQCkGtdN1#s}xEE87u3GD_
zSJB)5omQW|bVliwwCgM6sm^bsQCX?tp^hgbl}uLeO1AXlkmOTY-%?(--QGOzqqJT}
zkTHXLyI0V6HV=@gH$_APTBXo)4iI1Dq>^*ghB0)9IpIs-o^F+g&%w<_SNIwe_b&E6
zinj>~=$caw!x4|v1?(kMzES$_`tJz3u+QD(zA)Bs(bYYWhG3E4iKBMXkG*^*(Y@UC
zJ){Q6XW-3qtbb&&ryJNNmd;5##T^#iBhuPKpC!E$6xq!(3T@(9XKZzioNh7*eH^k@
z3ZqX3S;5hh6?*7-EwP+tr^>`j3OWU%Qwa&cU&?76Cqt#kdURT$7VqKaiN^a<@$H7>
z&{eF{k`CffP5t6vjyPCnKJlp;u?yN}d3dxpo?BW`e^)+&ry@5Gd24AUDQB(Hh@aiy
ziDQ1I^7PbOq0K~GEF&>+tY){NL?mC}u|~LzlSKC7BU?Pw4)SoxQo6!IDP!puN=c$V
zifD3o@Hf~;EAi@%^j>=Z@Ge;<g1(|4`*x83c1TH^RSH|{QGacg;_CzthrdjDS<%}p
zk;tD$T=-<De&f(5iCdh0*49mwy0?DWSwehX(l<aWEwb~mS$bV>qND-zezE~=N^v4~
zc6HN_A)|C-Y?ypt?NEffv{<s}aofYLv6jw8)(`j4FC$V*S_C-X!;uHQLdelgr3s$V
zUv@F4*(pfr`)H2d1irDH8GAzg5^{a08C9jdwQ``$VeJAk(nB4H7v`mA7NF}KO2&*Q
zg8NCgM%q{LZj2p_BIdNJH`Kh+#l1!nsP=>FxD13xHEi2hF`jBWnwI!oO*lfyyIYi_
zuV%*D)ctIDgM+%_Ko+^3dO22BvWDKszJXqYl)4{Z$55et=|-l@N~m3&Vy{xQ8={+@
zHPWOMwB_(EM<+M^L^74q?-LhQF`6hVOJ5K`-RKKOd^Ze6^u$l;{m?j;jxB&w%u7X7
zpNi!Du~`}+z2MklD^V)@2-Fq&>p8JH^a<>6BJ}Oat+m9Leuyu&Ev|m@DLO5|dmSC!
z90Q4(oJABB&I@z|`h|63Yt0HXY**c!OsDy&B)bjr@Z_Q%FM+23zT}{v(eDSFwAJTw
z))rOp`3QJ2@R^ayGeG;L!f>>eVCc2p-IkDcnkThN_|bW51&)*EN<GkG!HK0I{8@BY
z`jt>ssYU0QN<Pr+*V5XdnZ$H((^KK0&x@DD)9>l~!%`h}{Zeuk>LgA)1&~ih@X&|J
zYtS#j0xob&ks>mnlV+w=nE}0%6UR;H17x|<57HZc`W)^F^pvb;^e{A9Apu?Vl&2k{
zOKySdHtgeU=jN!wooxghuWOBmVj4El_guc6Rgc!J+CjYsl;$Ec%)^xl>LcKqs_(MM
zc223(U3b0EX0jgGQ*DtGk87zMgY{nI0QB}tB<NSlh925&=-ENP!VYB@=`znl>!cQr
z2>%!Lt1<!V#&XPa8k%eKWB|8o4cfY;JL#a`eTHL=T!kZ@4nc1i3Q>bfqK^-DDxw@i
zEE3PqC(F5>s=uC^bJ0(<f!Y_ltWoNrTHX29o4cA)+!yG6kIG``1BgF8TZYSIP`#~l
zt=;sa@YWFMw{mvyhdxMJ_43v)xWMz2wXyyyu|N;?P<p92sE<=u)CPILIu!lmWFPcB
zWFzS4zitXw`Zx4;wK3EOIQOfK(}?y3Xww2(CmBjlRtLn-Lz|`fnER-<<nS;k!m!*%
zDbY>6a63L2<bHEUHc2HjyF6ThdN&1^ejDzGXBQ;@-o%s6brgI{=xT;A>Y!UIhZRL8
z6yXm!_#HYti@`AU=B`M{pbibySn9@YB&TvmF{i`PhJ6gz{&NHrjiu#dQ^h?({$(VQ
zZpQK0q`1di@+M>H^c}(Ou@PE-IjiK={wu$neL7kZUruGzhmN@D)6p>AA?c0W8u!RZ
zt=5-#t|1>iHp#3pO8-Sq-cY?4YULh*#z8!kg6gLDJvNoyR4MW)Bg4Ta{IRLT*l4X+
z*Cm8C6F8$+cslw8*(m{uA!rSMlAAUj>(oR79lU#NjOM;!*pgo9u}OrA5l(E@V)eMy
z&U|btx<>=q#SwUY!K=Bh&;MbB8LN8MhChT@Wyd-;PXAqw`bQ|<$5?`UjBl6oYbSk?
zHw>=Frkr~;6E6&5ydhRPt>a}GAFsDqr6qvz1U&JSj+b$d2V>!q#Bp1y{z!2?Hu3Ip
z7oFU&f;JQJ4FdNlk4-6NCTInGx3K!r390BFn`o#jxf!cTJ?luuihpckp=F%&Bvqj%
zQMQvlWe8n4a$?+bPFc#?xG6}@!5g^`rvt{59-E@fPvRU*j`oRAd}?u`Z;V&Apb`|N
z-o`woiKN%*Lu5CltKG(_n}2o8N}cJ$=18Z*+41JSWNc@Bx5Om6fdzC@d1ct)Y~WFq
zb8x)QP1ap4mI%&H0TOc9hrfM!hh4!l=cIp?U)49c%d6+6*MCubM?(IpmO3Lnbabko
z$OeedFRF8#yzLot5uXj=en*DZg=(61AR8nd&H-TM$aIf6={s*S)&)DbbZokMLUUQi
z*f5FKkvBDywU*(?FG+V^EQ7HbHWSJ4pS6zek|8=aQzP}14F5@Y6D8esY?gMBOYIjE
zzCY*}zys?rI$OPU4ag?^sM>VWu{oM^`hq6A_={H7W;!}oWmez>RtxTn5|+-`d_4=)
z2gTIy_2gb$T>4I8q5fNhjrd2#w`!LY(o#nk>4|I$u@}c^bs42&i#5+SB2$i*36HcR
z8zlDMRxj1FP#Lg3K^`hCi4PUe(K03to|Ssr^9t2S|D}$;z4mcnt6Q2OPDoD=g_E@!
zKz9%sUvpRVy4(PV(3_fb=7^tCt<(B-m~%i;Mg~!LI?DKK?tdv?UmB=(kN>~?e=GdC
HRgC-}TzMV3

literal 0
HcmV?d00001

-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

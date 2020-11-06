Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C54CA2A9B7F
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:03:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E70DC36B36;
	Fri,  6 Nov 2020 18:03:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE80AC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6Hw3br013437; Fri, 6 Nov 2020 19:02:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=TpXV7BUEVGZU8n1Jm7917xBALK12oLrqQur4swjMu9I=;
 b=Sfoee7xjs+Se1CpwhIzWLWw9ph5/BMNydaVPrNeoUm5d7I8sdeBo4zh1KZevvWITyRqR
 MEk9X/Vfx1oC5AjllwuTlggmCBIsKPFfwL+IUt2NRVBINWaWHiz1LWelCSGELJS/IpRI
 gupQUlPlxnd+1YVyDceSCWlFuecXaNLIEV51hOGtJpurG+WkuoFR4SL0AAL7qKrPwuT1
 KylzCh67Yt6zVcJ2+R0/anEXhJoO6YQ2KTqjYBnHbnaWzVqWjRYmFFc99jR23S3LReqd
 RYgiWjZur3bN0SAGQrjF0YGigi/jaamo/vYI08nqNwK2xcbjyjtVAn7ghYRqU3At8+nP jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gyw1xgea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B38810002A;
 Fri,  6 Nov 2020 19:02:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9319A25079D;
 Fri,  6 Nov 2020 19:02:53 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:52
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:57 +0100
Message-ID: <20201106180201.31784-30-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Anatolij Gustschin <agust@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 29/33] video: stm32_ltdc: migrate trace to
	dev and log macro
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

Change pr_* to dev_ or log_ macro and define LOG_CATEGORY.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

(no changes since v1)

 drivers/video/stm32/stm32_ltdc.c | 33 +++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
index 7fff735930..c5c990cc73 100644
--- a/drivers/video/stm32/stm32_ltdc.c
+++ b/drivers/video/stm32/stm32_ltdc.c
@@ -5,6 +5,8 @@
  *	      Yannick Fertre <yannick.fertre@st.com> for STMicroelectronics.
  */
 
+#define LOG_CATEGORY UCLASS_VIDEO
+
 #include <common.h>
 #include <clk.h>
 #include <display.h>
@@ -176,13 +178,13 @@ static u32 stm32_ltdc_get_pixel_format(enum video_log2_bpp l2bpp)
 	case VIDEO_BPP2:
 	case VIDEO_BPP4:
 	default:
-		pr_warn("%s: warning %dbpp not supported yet, %dbpp instead\n",
-			__func__, VNBITS(l2bpp), VNBITS(VIDEO_BPP16));
+		log_warning("warning %dbpp not supported yet, %dbpp instead\n",
+			    VNBITS(l2bpp), VNBITS(VIDEO_BPP16));
 		pf = PF_RGB565;
 		break;
 	}
 
-	debug("%s: %d bpp -> ltdc pf %d\n", __func__, VNBITS(l2bpp), pf);
+	log_debug("%d bpp -> ltdc pf %d\n", VNBITS(l2bpp), pf);
 
 	return (u32)pf;
 }
@@ -249,7 +251,7 @@ static void stm32_ltdc_set_mode(struct stm32_ltdc_priv *priv,
 
 	/* Signal polarities */
 	val = 0;
-	debug("%s: timing->flags 0x%08x\n", __func__, timings->flags);
+	log_debug("timing->flags 0x%08x\n", timings->flags);
 	if (timings->flags & DISPLAY_FLAGS_HSYNC_HIGH)
 		val |= GCR_HSPOL;
 	if (timings->flags & DISPLAY_FLAGS_VSYNC_HIGH)
@@ -379,8 +381,8 @@ static int stm32_ltdc_probe(struct udevice *dev)
 		dev_warn(dev, "fail to set pixel clock %d hz\n",
 			 timings.pixelclock.typ);
 
-	debug("%s: Set pixel clock req %d hz get %ld hz\n", __func__,
-	      timings.pixelclock.typ, clk_get_rate(&pclk));
+	dev_dbg(dev, "Set pixel clock req %d hz get %ld hz\n",
+		timings.pixelclock.typ, clk_get_rate(&pclk));
 
 	ret = reset_get_by_index(dev, 0, &rst);
 	if (ret) {
@@ -394,12 +396,13 @@ static int stm32_ltdc_probe(struct udevice *dev)
 	if (IS_ENABLED(CONFIG_VIDEO_BRIDGE)) {
 		ret = uclass_get_device(UCLASS_VIDEO_BRIDGE, 0, &bridge);
 		if (ret)
-			debug("No video bridge, or no backlight on bridge\n");
+			dev_dbg(dev,
+				"No video bridge, or no backlight on bridge\n");
 
 		if (bridge) {
 			ret = video_bridge_attach(bridge);
 			if (ret) {
-				dev_err(dev, "fail to attach bridge\n");
+				dev_err(bridge, "fail to attach bridge\n");
 				return ret;
 			}
 		}
@@ -414,12 +417,12 @@ static int stm32_ltdc_probe(struct udevice *dev)
 	priv->crop_h = timings.vactive.typ;
 	priv->alpha = 0xFF;
 
-	debug("%s: %dx%d %dbpp frame buffer at 0x%lx\n", __func__,
-	      timings.hactive.typ, timings.vactive.typ,
-	      VNBITS(priv->l2bpp), uc_plat->base);
-	debug("%s: crop %d,%d %dx%d bg 0x%08x alpha %d\n", __func__,
-	      priv->crop_x, priv->crop_y, priv->crop_w, priv->crop_h,
-	      priv->bg_col_argb, priv->alpha);
+	dev_dbg(dev, "%dx%d %dbpp frame buffer at 0x%lx\n",
+		timings.hactive.typ, timings.vactive.typ,
+		VNBITS(priv->l2bpp), uc_plat->base);
+	dev_dbg(dev, "crop %d,%d %dx%d bg 0x%08x alpha %d\n",
+		priv->crop_x, priv->crop_y, priv->crop_w, priv->crop_h,
+		priv->bg_col_argb, priv->alpha);
 
 	/* Configure & start LTDC */
 	stm32_ltdc_set_mode(priv, &timings);
@@ -457,7 +460,7 @@ static int stm32_ltdc_bind(struct udevice *dev)
 	uc_plat->size = CONFIG_VIDEO_STM32_MAX_XRES *
 			CONFIG_VIDEO_STM32_MAX_YRES *
 			(CONFIG_VIDEO_STM32_MAX_BPP >> 3);
-	debug("%s: frame buffer max size %d bytes\n", __func__, uc_plat->size);
+	dev_dbg(dev, "frame buffer max size %d bytes\n", uc_plat->size);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

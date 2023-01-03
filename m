Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 593DF65EE1C
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Jan 2023 15:01:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 911E4C6907B;
	Thu,  5 Jan 2023 14:01:31 +0000 (UTC)
Received: from zulu616.server4you.de (mail.csgraf.de [85.25.223.15])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22DCFC69052
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 21:50:12 +0000 (UTC)
Received: from localhost.localdomain
 (dynamic-092-225-244-121.92.225.pool.telefonica.de [92.225.244.121])
 by csgraf.de (Postfix) with ESMTPSA id 65F476080912;
 Tue,  3 Jan 2023 22:50:11 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: u-boot@lists.denx.de
Date: Tue,  3 Jan 2023 22:50:03 +0100
Message-Id: <20230103215004.22646-9-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230103215004.22646-1-agraf@csgraf.de>
References: <20230103215004.22646-1-agraf@csgraf.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Jan 2023 14:01:29 +0000
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: [Uboot-stm32] [PATCH v4 8/9] video: Always compile cache flushing
	code
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

The dcache flushing code path was conditional on ARM && !DCACHE config
options. However, dcaches exist on other platforms as well and may need
clearing if their driver requires it.

Simplify the compile logic and always enable the dcache flush logic in
the video core. That way, drivers can always rely on it to call the arch
specific callbacks.

This will increase code size for non-ARM platforms with CONFIG_VIDEO=y
slightly.

Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 drivers/video/video-uclass.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/video/video-uclass.c b/drivers/video/video-uclass.c
index 956863f98a..bad5eedc96 100644
--- a/drivers/video/video-uclass.c
+++ b/drivers/video/video-uclass.c
@@ -285,11 +285,13 @@ int video_damage(struct udevice *vid, int x, int y, int width, int height)
 	return 0;
 }
 
-#if defined(CONFIG_ARM) && !CONFIG_IS_ENABLED(SYS_DCACHE_OFF)
 static void video_flush_dcache(struct udevice *vid)
 {
 	struct video_priv *priv = dev_get_uclass_priv(vid);
 
+	if (CONFIG_IS_ENABLED(SYS_DCACHE_OFF))
+		return;
+
 	if (!priv->flush_dcache)
 		return;
 
@@ -318,7 +320,6 @@ static void video_flush_dcache(struct udevice *vid)
 		}
 	}
 }
-#endif
 
 static void video_flush_copy(struct udevice *vid)
 {
@@ -357,14 +358,9 @@ int video_sync(struct udevice *vid, bool force)
 			return ret;
 	}
 
-	/*
-	 * flush_dcache_range() is declared in common.h but it seems that some
-	 * architectures do not actually implement it. Is there a way to find
-	 * out whether it exists? For now, ARM is safe.
-	 */
-#if defined(CONFIG_ARM) && !CONFIG_IS_ENABLED(SYS_DCACHE_OFF)
 	video_flush_dcache(vid);
-#elif defined(CONFIG_VIDEO_SANDBOX_SDL)
+
+#if defined(CONFIG_VIDEO_SANDBOX_SDL)
 	static ulong last_sync;
 
 	if (force || get_timer(last_sync) > 100) {
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

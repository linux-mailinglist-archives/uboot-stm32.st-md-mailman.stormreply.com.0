Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C3465EE15
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Jan 2023 15:01:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50C7BC6906C;
	Thu,  5 Jan 2023 14:01:31 +0000 (UTC)
Received: from zulu616.server4you.de (mail.csgraf.de [85.25.223.15])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B71FFC65048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 21:50:07 +0000 (UTC)
Received: from localhost.localdomain
 (dynamic-092-225-244-121.92.225.pool.telefonica.de [92.225.244.121])
 by csgraf.de (Postfix) with ESMTPSA id E64A26080912;
 Tue,  3 Jan 2023 22:50:06 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: u-boot@lists.denx.de
Date: Tue,  3 Jan 2023 22:49:57 +0100
Message-Id: <20230103215004.22646-3-agraf@csgraf.de>
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
Subject: [Uboot-stm32] [PATCH v4 2/9] dm: video: Add damage notification on
	display clear
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

Let's report the video damage when we clear the screen. This
way we can later lazily flush only relevant regions to hardware.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reported-by: Da Xue <da@libre.computer>
---
 drivers/video/video-uclass.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/video-uclass.c b/drivers/video/video-uclass.c
index d18c8cd2b1..48fc29aeb0 100644
--- a/drivers/video/video-uclass.c
+++ b/drivers/video/video-uclass.c
@@ -160,6 +160,8 @@ int video_fill(struct udevice *dev, u32 colour)
 	if (ret)
 		return ret;
 
+	video_damage(dev, 0, 0, priv->xsize, priv->ysize);
+
 	return video_sync(dev, false);
 }
 
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

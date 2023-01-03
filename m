Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACBA65EE18
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Jan 2023 15:01:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 766D3C69075;
	Thu,  5 Jan 2023 14:01:31 +0000 (UTC)
Received: from zulu616.server4you.de (mail.csgraf.de [85.25.223.15])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A5A7C65048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 21:50:10 +0000 (UTC)
Received: from localhost.localdomain
 (dynamic-092-225-244-121.92.225.pool.telefonica.de [92.225.244.121])
 by csgraf.de (Postfix) with ESMTPSA id 50B126080F3C;
 Tue,  3 Jan 2023 22:50:09 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: u-boot@lists.denx.de
Date: Tue,  3 Jan 2023 22:50:00 +0100
Message-Id: <20230103215004.22646-6-agraf@csgraf.de>
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
Subject: [Uboot-stm32] [PATCH v4 5/9] efi_loader: GOP: Add damage
	notification on BLT
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

Now that we have a damage tracking API, let's populate damage done by
UEFI payloads when they BLT data onto the screen.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reported-by: Da Xue <da@libre.computer>

---

v1 -> v2:

  - Remove ifdefs from gop

v2 -> v3:

  - Adapt to always assume DM is used

v3 -> v4:

  - Skip damage on EfiBltVideoToBltBuffer
---
 lib/efi_loader/efi_gop.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/efi_loader/efi_gop.c b/lib/efi_loader/efi_gop.c
index d1dc2f22d0..425dcbf6b1 100644
--- a/lib/efi_loader/efi_gop.c
+++ b/lib/efi_loader/efi_gop.c
@@ -32,6 +32,7 @@ struct efi_gop_obj {
 	struct efi_gop ops;
 	struct efi_gop_mode_info info;
 	struct efi_gop_mode mode;
+	struct udevice *vdev;
 	/* Fields we only have access to during init */
 	u32 bpix;
 	void *fb;
@@ -120,6 +121,7 @@ static __always_inline efi_status_t gop_blt_int(struct efi_gop *this,
 	u32 *fb32 = gopobj->fb;
 	u16 *fb16 = gopobj->fb;
 	struct efi_gop_pixel *buffer = __builtin_assume_aligned(bufferp, 4);
+	bool blt_to_video = (operation != EFI_BLT_VIDEO_TO_BLT_BUFFER);
 
 	if (delta) {
 		/* Check for 4 byte alignment */
@@ -243,6 +245,9 @@ static __always_inline efi_status_t gop_blt_int(struct efi_gop *this,
 		dlineoff += dwidth;
 	}
 
+	if (blt_to_video)
+		video_damage(gopobj->vdev, dx, dy, width, height);
+
 	return EFI_SUCCESS;
 }
 
@@ -547,6 +552,7 @@ efi_status_t efi_gop_register(void)
 	gopobj->info.pixels_per_scanline = col;
 	gopobj->bpix = bpix;
 	gopobj->fb = fb;
+	gopobj->vdev = vdev;
 
 	return EFI_SUCCESS;
 }
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

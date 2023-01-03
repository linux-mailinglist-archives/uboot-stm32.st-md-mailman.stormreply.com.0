Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B2E65EE13
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Jan 2023 15:01:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35AFCC69067;
	Thu,  5 Jan 2023 14:01:31 +0000 (UTC)
Received: from zulu616.server4you.de (mail.csgraf.de [85.25.223.15])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA2A0C65048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 21:50:06 +0000 (UTC)
Received: from localhost.localdomain
 (dynamic-092-225-244-121.92.225.pool.telefonica.de [92.225.244.121])
 by csgraf.de (Postfix) with ESMTPSA id 8D444608030D;
 Tue,  3 Jan 2023 22:50:05 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: u-boot@lists.denx.de
Date: Tue,  3 Jan 2023 22:49:55 +0100
Message-Id: <20230103215004.22646-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
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
Subject: [Uboot-stm32] [PATCH v4 0/9] Add video damage tracking
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

This patch set speeds up graphics output on ARM by a factor of 60x.

On most ARM SBCs, we keep the frame buffer in DRAM and map it as cached,
but need it accessible by the display controller which reads directly
from a later point of consistency. Hence, we flush the frame buffer to
DRAM on every change. The full frame buffer.

Unfortunately, with the advent of 4k displays, we are seeing frame buffers
that can take a while to flush out. This was reported by Da Xue with grub,
which happily print 1000s of spaces on the screen to draw a menu. Every
printed space triggers a cache flush.

This patch set implements the easiest mitigation against this problem:
Damage tracking. We remember the lowest common denominator region that was
touched since the last video_sync() call and only flush that. The most
typical writer to the frame buffer is the video console, which always
writes rectangles of characters on the screen and syncs afterwards.

With this patch set applied, we reduce drawing a large grub menu (with
serial console attached for size information) on an RK3399-ROC system
at 1440p from 55 seconds to less than 1 second.

Version 2 also implements VIDEO_COPY using this mechanism, reducing its
overhead compared to before as well. So even x86 systems should be faster
with this now :).


Alternatives considered:

  1) Lazy sync - Sandbox does this. It only calls video_sync(true) ever
     so often. We are missing timers to do this generically.

  2) Double buffering - We could try to identify whether anything changed
     at all and only draw to the FB if it did. That would require
     maintaining a second buffer that we need to scan.

  3) Text buffer - Maintain a buffer of all text printed on the screen with
     respective location. Don't write if the old and new character are
     identical. This would limit applicability to text only and is an
     optimization on top of this patch set.

  4) Hash screen lines - Create a hash (sha256?) over every line when it
     changes. Only flush when it does. I'm not sure if this would waste
     more time, memory and cache than the current approach. It would make
     full screen updates much more expensive.

v1 -> v2:

  - new patch: video: Use VIDEO_DAMAGE for VIDEO_COPY
  - Remove ifdefs
  - Fix dcache range; we were flushing too much before
  - Fix ranges in truetype target
  - Limit rotate to necessary damange

v2 -> v3:

  - Rebase
  - Adapt to DM_VIDEO always
  - Make CONFIG_COPY always select VIDEO_DAMAGE

v3 -> v4:

  - New patch: video: Always compile cache flushing code
  - New patch: video: Enable VIDEO_DAMAGE for drivers that need it
  - Simplify first damage logic
  - Skip damage on EfiBltVideoToBltBuffer
  - Move damage clear from patch 6 to patch 1
  - Remove VIDEO_DAMAGE default for ARM

Alexander Graf (9):
  dm: video: Add damage tracking API
  dm: video: Add damage notification on display clear
  vidconsole: Add damage notifications to all vidconsole drivers
  video: Add damage notification on bmp display
  efi_loader: GOP: Add damage notification on BLT
  video: Only dcache flush damaged lines
  video: Use VIDEO_DAMAGE for VIDEO_COPY
  video: Always compile cache flushing code
  video: Enable VIDEO_DAMAGE for drivers that need it

 arch/arm/mach-omap2/omap3/Kconfig |   1 +
 arch/arm/mach-sunxi/Kconfig       |   1 +
 drivers/video/Kconfig             |  27 +++++
 drivers/video/console_normal.c    |  22 ++--
 drivers/video/console_rotate.c    |  87 +++++++++-----
 drivers/video/console_truetype.c  |  30 ++---
 drivers/video/exynos/Kconfig      |   1 +
 drivers/video/imx/Kconfig         |   1 +
 drivers/video/meson/Kconfig       |   1 +
 drivers/video/rockchip/Kconfig    |   1 +
 drivers/video/stm32/Kconfig       |   1 +
 drivers/video/vidconsole-uclass.c |  16 ---
 drivers/video/video-uclass.c      | 187 +++++++++++++++++-------------
 drivers/video/video_bmp.c         |   7 +-
 include/video.h                   |  54 ++++-----
 include/video_console.h           |  49 --------
 lib/efi_loader/efi_gop.c          |   6 +
 17 files changed, 251 insertions(+), 241 deletions(-)

-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

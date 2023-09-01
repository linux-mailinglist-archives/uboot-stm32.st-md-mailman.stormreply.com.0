Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD3E78F69E
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Sep 2023 03:14:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25DEEC6A615;
	Fri,  1 Sep 2023 01:14:03 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 383A4C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 01:14:02 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7951f0e02ecso55532439f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 18:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693530841; x=1694135641;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZKyqURtRYWnlF8FrpJYBi1/3tPdP5V0+7i/ka+3SkMQ=;
 b=c/b66UpwSUM7tIdnuXMqlgUVKnE6ww3Hw+P0QPBOu358pCVvjO9Onjejdo5J+VMeGa
 BsOosk3cHkf26F419S5rN/nsucNTuG0kehvynXnZlLtzsI3pJu7tv6h7sEXofeBftQEv
 mlGMid/PkStFbJXRlfJnMOWiQuMACtTsfEyn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693530841; x=1694135641;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZKyqURtRYWnlF8FrpJYBi1/3tPdP5V0+7i/ka+3SkMQ=;
 b=fi1DvxJlgCIY3rZWksl3/n/CuwecWu4udcB+3NH/wrZsZKZlttzJEhXdTRTySGnxdB
 Wa/IlRyLAuzb2m0QnftOHMkv7yHJEh6kBXEAWvh5wUOu/yR0RaIYQzkkSoBjU5ufogoZ
 C0Oq81UG5rLrE2lU8eJzPMK2s8gNxu4rfXb8GCu4Cq6pAjySECp+41zBqhKdM6LsIRk8
 DNRtQzXekG3NJ4oUGmXDco4ilRAomrQNOU6fr5EgJOMhT8WnZTLarx7RFywggiQw4eTl
 M8+moYbmXRLIaUTFulCKVJckdYs5DOSLjkwIRXTVpLsLYgLY9T/CDtvK9xRrMyrWHLIQ
 4y4w==
X-Gm-Message-State: AOJu0Yz79TsuoYD96rOITpHus+cjK0bl2azt51VCpZKzBQ6wRmJewKhc
 Yc4RdeRo/cdkF5tbEUieY1zCYA==
X-Google-Smtp-Source: AGHT+IFmeTSAQ0DSshwsDsGeUxtMrAwd6X6U/W+5kMNUDYLs1a0eQX1Zg9/u6pxWetloyd6ktXKnng==
X-Received: by 2002:a6b:fe16:0:b0:785:d4f5:2225 with SMTP id
 x22-20020a6bfe16000000b00785d4f52225mr1065953ioh.19.1693530841031; 
 Thu, 31 Aug 2023 18:14:01 -0700 (PDT)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 dk8-20020a0566384bc800b0042b279bb086sm712101jab.66.2023.08.31.18.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 18:14:00 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Thu, 31 Aug 2023 19:13:38 -0600
Message-ID: <20230901011357.2482203-1-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Wei Fu <wefu@redhat.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Mark Kettenis <kettenis@openbsd.org>,
 Brandon Maier <brandon.maier@collins.com>,
 Kautuk Consul <kconsul@ventanamicro.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Nikhil M Jain <n-jain1@ti.com>,
 Sjoerd Simons <sjoerd@collabora.com>, Sam Shih <sam.shih@mediatek.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Yixun Lan <dlan@gentoo.org>, Bin Meng <bmeng.cn@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Sumit Garg <sumit.garg@linaro.org>
Subject: [Uboot-stm32] [PATCH v2 00/14] Correct confusing lmb error message
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

I ran into a very confusing error message about overlapping memory. I
found that the message is not correct, so this series refactors the lmb
code a little to permit the real message to be displayed, which is that
the internal lmb table has overflowed.

It also tidies up the code a little.

Feedback on the initial series showed some confusion between one type of
region and another. I had the same confusion, so this series renames the
inner 'region' to 'area'.

Changes in v2:
- Add new patch to rename region array to area
- Add new patch to rename memory/reserved_regions to area
- Add new patch to rename LMB_MAX_REGIONS and LMB_USE_MAX_REGIONS
- Add new patch to rename LMB_MAX_REGIONS and LMB_USE_MAX_REGIONS
- Add new patch to update use of region in the header file
- Add new patch to update use of region in the C file

Simon Glass (14):
  lmb: Drop surplus brackets and fix code style
  lmb: Rename interior piece to area
  lmb: Rename region array to area
  lmb: Rename memory/reserved_regions to area
  lmb: Rename LMB_MAX_REGIONS and LMB_USE_MAX_REGIONS
  lmb: Rename LMB_MAX_REGIONS and LMB_USE_MAX_REGIONS
  lmb: Update use of region in the header file
  lmb: Update use of region in the C file
  lmb: Tidy up structure access
  lmb: Avoid long for loop counters and function returns
  lmb: Change functions returning long to return int
  lmb: Tidy up lmb_overlaps_region()
  lmb: Document and tidy lmb_add_region_flags()
  fs: Fix a confusing error about overlapping regions

 configs/a3y17lte_defconfig           |   2 +-
 configs/a5y17lte_defconfig           |   2 +-
 configs/a7y17lte_defconfig           |   2 +-
 configs/apple_m1_defconfig           |   2 +-
 configs/dragonboard845c_defconfig    |   2 +-
 configs/mt7981_emmc_rfb_defconfig    |   2 +-
 configs/mt7981_rfb_defconfig         |   2 +-
 configs/mt7981_sd_rfb_defconfig      |   2 +-
 configs/mt7986_rfb_defconfig         |   2 +-
 configs/mt7986a_bpir3_emmc_defconfig |   2 +-
 configs/mt7986a_bpir3_sd_defconfig   |   2 +-
 configs/qcs404evb_defconfig          |   2 +-
 configs/starqltechn_defconfig        |   2 +-
 configs/stm32mp13_defconfig          |   6 +-
 configs/stm32mp15_basic_defconfig    |   6 +-
 configs/stm32mp15_defconfig          |   6 +-
 configs/stm32mp15_trusted_defconfig  |   6 +-
 configs/th1520_lpi4a_defconfig       |   2 +-
 fs/fs.c                              |   7 +-
 include/lmb.h                        | 105 ++++----
 lib/Kconfig                          |  30 +--
 lib/lmb.c                            | 349 +++++++++++++++------------
 test/cmd/bdinfo.c                    |   6 +-
 test/lib/lmb.c                       | 150 ++++++------
 24 files changed, 382 insertions(+), 317 deletions(-)

-- 
2.42.0.283.g2d96d420d3-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

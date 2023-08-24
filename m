Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FC87865AA
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Aug 2023 05:03:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD2D0C6B44B;
	Thu, 24 Aug 2023 03:03:21 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4CE7C6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 03:03:20 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-34cacab5e34so12358505ab.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 20:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692846199; x=1693450999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0TaNjr1wGiZnLNvnl6HUfz8BPmbHk1j3DsY8RftT8y0=;
 b=Wb9xTUlPoIDTO0F6mBm8sKALmOwSYxtyvaJRiM6NCrKPlk/JLgpjOp+Bs2J5B+Oxd7
 wMHf1tn+Op/NWDucnIIb55mLws2xBKVyt3qWsgeJvHAI3w2kz1tppizwBnXjvR1jo67S
 EMJ9OZpEpPG33pGfk8hfg0IV4ldpf2qX8FvSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692846199; x=1693450999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0TaNjr1wGiZnLNvnl6HUfz8BPmbHk1j3DsY8RftT8y0=;
 b=g9e8h6IO9ckloEwQOqOWpSSjUtMfOC9rUK1AvJI9wl04sBGLuWRWZ/P6fSANhcZDY4
 LS6qLBJFnP7dKxoyTSH3b9JBPWE8kOIDAhkZcLn+U3pkEWOu7V+93y0lBRCMkZ9BCBaB
 OpLA8aarvaZ02gZwjaj2suMrYj7ofENP7HjIbDSwEKG4fAqLmXgsJUf/uRG736bTImHO
 WaiBVAmcjybA6/GZgLE+UEzKtuKWE2kX8q2SyvAe2w7GJSNJIq8reuv+S5RMSsOKDYx/
 4RvnZ8i/77z9NY7os4nQGKkaR9s90mS2SUEkvZ7zJOws+x5GyoS96iGSCX4Td1cG3827
 J3rw==
X-Gm-Message-State: AOJu0YzACe04NYal/RgP7YL6Lcp4ntmCSfwIjaaV0yFIW+hUn+C9rrbY
 IEAp1eDin8TtccX3xUTKFT6Bww==
X-Google-Smtp-Source: AGHT+IHalleRke17z3NHQzBiJyQ8WEfQmejlVxy5wHxJXaX7Eo4fsCNy5BGT4fbBwkRtFZef6FrQWw==
X-Received: by 2002:a05:6e02:11ad:b0:349:2bb0:c87d with SMTP id
 13-20020a056e0211ad00b003492bb0c87dmr3706852ilj.32.1692846199597; 
 Wed, 23 Aug 2023 20:03:19 -0700 (PDT)
Received: from localhost.localdomain (c-73-14-173-85.hsd1.co.comcast.net.
 [73.14.173.85]) by smtp.gmail.com with ESMTPSA id
 u4-20020a92ccc4000000b00345fcbce508sm4274117ilq.39.2023.08.23.20.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 20:03:19 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Wed, 23 Aug 2023 21:02:53 -0600
Message-ID: <20230824030304.1555547-1-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peng Fan <peng.fan@nxp.com>, Philippe Reynes <philippe.reynes@softathome.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Jonas Karlman <jonas@kwiboo.se>, Simon Glass <sjg@chromium.org>,
 Neha Malcom Francis <n-francis@ti.com>, Michael Walle <michael@walle.cc>,
 Ivan Mikhaylov <fr0st61te@gmail.com>, Vikas Manocha <vikas.manocha@st.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 uboot-stm32@st-md-mailman.stormreply.com, Kamil Lulko <kamil.lulko@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH 0/6] Attempt to enforce standard extensions
	for build output
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

In this early stage of using binman to produce output files, we are mostly
seeing people using common extensions such as '.bin' and '.rom'

But unusual extensions appear in some places.

We would like 'buildman -k' to keep the build outputs, but this is hard if
there is no consistency as to the extension used.

This series adjusts binman to enforce just 4 extensions for output images:

   .bin
   .rom
   .itb
   .img

Other extensions will produce an error. With this rule observed, buildman
can keep the required files.

Some patches are included to fix up some easy problems. But the following
boards generate 'custMpk.pem' and it is not clear how to fix this, so I am
asking for help from the maintainers:

   am62ax_evm_r5 am62x_evm_r5 am64x_evm_r5 am65x_evm_r5
   am65x_evm_r5_usbdfu am65x_evm_r5_usbmsc am65x_hs_evm_r5
   j7200_evm_r5 j721e_evm_r5 j721s2_evm_r5 verdin-am62_r5
   am62ax_evm_a53 am62x_evm_a53 am64x_evm_a53 am65x_evm_a53
   am65x_hs_evm_a53 j7200_evm_a72 j721e_evm_a72 j721s2_evm_a72
   verdin-am62_a53

It looks like the .pem files are listed as top-level images, e.g.:

   &custmpk_pem {
      filename = "../../ti/keys/custMpk.pem";
   };

but if the only objective is to pick up an existing file, it is better to
set BINMAN_INDIRS to include that directory. Also we should only have
simple leafnames in the 'filename' property, so the '../../ti/keys' is not
correct. It makes it harder for people to get the files from other places.
Making this easier is one of binman's goals.

Most likely the custmpk_pem node can be removed and the .pem file can be
included directly in the place that needs it, e.g. by adjusting the
ti-secure-rom etype (or ex509_cert) to use tools.get_input_filename() when
reading the key file.

For example, this:

   custMpk {
      filename = "custMpk.pem";
      custmpk_pem: blob-ext {
         filename = "../keys/custMpk.pem";
      };
   };

is really just copying a file from '../keys/custMpk.pem' to 'custMpk.pem'
so is equivalent to:

   custMpk {
      type = "blob";
      filename = "custMpk.pem";
   }

(note that blob-ext implies that the blob may be missing, so blob is a
better choice, since the key cannot be missing)

The fact that the .pem files are at the top level means that they are
output images, which surely is not intended. They should be buried in the
image description, at a lower level, as part of something else.

So please take a loke at the above and see if the binman descriptions can
be reworked slightly to follow these new rules.


Simon Glass (6):
  binman: Require image filenames to have certain extensions
  buildman: Keep all permitted output files
  buildman: Show progress when regenerating the board.cfg file
  buildman: Start the clock when the build starts
  kontron_sl28: Use u-boot-update.bin instead of u-boot.update
  stm32mp15: Use u-boot-spl-stm32.bin instead of u-boot-spl.stm32

 .../dts/fsl-ls1028a-kontron-sl28-u-boot.dtsi   |  2 +-
 arch/arm/dts/stm32mp15-u-boot.dtsi             |  2 +-
 doc/board/kontron/sl28.rst                     |  4 ++--
 doc/board/st/stm32mp1.rst                      | 18 +++++++++---------
 include/configs/stm32mp15_dh_dhsom.h           |  2 +-
 tools/binman/binman.rst                        |  5 +++++
 tools/binman/etype/section.py                  |  3 +--
 tools/binman/ftest.py                          | 12 ++++++++++--
 tools/binman/image.py                          |  9 +++++++++
 tools/binman/test/022_image_name.dts           |  4 ++--
 tools/binman/test/311_bad_image_name.dts       | 17 +++++++++++++++++
 tools/buildman/boards.py                       | 15 ++++++++++++---
 tools/buildman/builder.py                      |  3 ++-
 tools/buildman/builderthread.py                | 11 +++++++----
 tools/buildman/control.py                      |  3 ++-
 15 files changed, 81 insertions(+), 29 deletions(-)
 create mode 100644 tools/binman/test/311_bad_image_name.dts

-- 
2.42.0.rc1.204.g551eb34607-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 196958156A8
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Dec 2023 04:14:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEEDEC6DD6C;
	Sat, 16 Dec 2023 03:14:54 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 336AEC6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Dec 2023 03:14:53 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-35f71face1bso5806835ab.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 19:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702696492; x=1703301292;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pSDc3axz2law/Mah60bpFK2zYIVNZKAwnpUbLns/heI=;
 b=iqv2ce7FCGWi/JhubBTsihliqe9wneXQt4xVNWbX6QRqQzhR/lU54GSMuyWVt6Rxqn
 yil+WrtfCwN5CbXvCD6fAsvOuqrb5kvNfaIVcOJLs/Dxdw9ymXb/v5EIwTwd6kdUENn8
 /Lgsr+ueLntB4y73h7pSBJcPRD8QI7khPUaic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702696492; x=1703301292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pSDc3axz2law/Mah60bpFK2zYIVNZKAwnpUbLns/heI=;
 b=rvFlmVrW17+PbSMAN7mOhASTj4rxqxu6eN1x7TwkCsB4G5qQiwJlJHV8zvwxwTnHdH
 YRzN0eqAWzbe8ynb3amrjViBuIF+DdiWiFd+QMclFWbFScwXjiVhSETEcegT9l8fuc9r
 JZ02DM6OL4fq6ki6H519/Dqz8nnWlexlwienH5AYlJ1y2VX68BrfiSJwxe/l1zmPh6Jg
 vnE+yz6Iqvh14bRJnpDKmomBiz9fkZrkQ8GiqvNfKtCkIW1mBllQL7L9qH2iSqtGWDUP
 r0C3yV7EFROOMhXy8K0dzYrLPfOkKdM+VqxUEWpR7h6tH8WlPRAgJyvc2173436JOeIG
 fS1A==
X-Gm-Message-State: AOJu0YzhNKW1/hEjEVKlH3Mx7+8qPY8lJ/CWr4O88qb6lX3Kp8jc12gN
 NQgeB1hlz66gXow4MPSIpMZ7fg==
X-Google-Smtp-Source: AGHT+IHhrj01Ckbkc01UL/B61aZCWuu9+XCar4O970M4/VuAk5qndCgyqx6if2QRvfM2YgxRZfNreQ==
X-Received: by 2002:a05:6e02:1a8b:b0:35f:847c:1e45 with SMTP id
 k11-20020a056e021a8b00b0035f847c1e45mr4551660ilv.28.1702696492016; 
 Fri, 15 Dec 2023 19:14:52 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a92ceca000000b0035f75e80d1esm542163ilq.52.2023.12.15.19.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 19:14:51 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Fri, 15 Dec 2023 20:14:04 -0700
Message-ID: <20231216031446.2222362-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
MIME-Version: 1.0
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Eddie James <eajames@linux.ibm.com>, Rick Chen <rick@andestech.com>,
 uboot-snps-arc@synopsys.com, Max Filippov <jcmvbkbc@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Michal Simek <michal.simek@amd.com>,
 Thomas Chou <thomas@wytron.com.tw>,
 Angelo Dureghello <angelo@kernel-space.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Scott McNutt <smcnutt@psyent.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Alison Wang <alison.wang@nxp.com>, Safae Ouajih <souajih@baylibre.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Leo <ycliang@andestech.com>,
 Nikita Shubin <n.shubin@yadro.com>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Chanho Park <chanho61.park@samsung.com>, Bin Meng <bmeng.cn@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [Uboot-stm32] [PATCH v3 00/22] Complete decoupling of bootm logic
	from commands
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

This series continues refactoring the bootm code to allow it to be used
with CONFIG_COMMAND disabled. The OS-handling code is refactored and
a new bootm_run() function is created to run through the bootm stages.
This completes the work.

A booti_go() function is created also, in case it proves useful, but at
last for now standard boot does not use this.

This is cmdd (part d of CMDLINE refactoring)
It depends on dm/bootstda-working
which depends on dm/cmdc-working

Changes in v3:
- Rename addr_fit to addr_img in struct bootm_info
- Rename addr_fit to addr_img in struct bootm_info
- Enable CONFIG_MEASURED_BOOT always and rely on CONFIG_MEASURED_BOOT
- Rename addr_fit to addr_img in struct bootm_info
- Add new boot_run() function

Changes in v2:
- Add new patch to enable more bootm OS methods in sandbox
- Split addition of struct bootm_info to its own patch
- Split changing of boot_os_fn parameters to a separate patch
- Split out adding the rest of struct bootm_info fields to separate patch
- Split out patch to move do_bootm_states() comment to header
- Split out booti removal of #ifdef
- Split out bootz removal of #ifdef
- Adjust patch to focus just on dropping the do_bootm_states() arguments
- Split do_bootm_states() rename to a separate patch
- Rework series to allow OS access to cmdline arguments for bootm

Simon Glass (22):
  mips: Add a reset_cpu() function
  m68k: Add a reset_cpu() function
  ppc: Add a reset_cpu() function
  nios2: Add a reset_cpu() function
  riscv: Add a reset_cpu() function
  bootm: Adjust how the board is reset
  sandbox: bootm: Enable more bootm OS methods
  bootm: Create a struct for argument information
  bootm: Adjust arguments of boot_os_fn
  bootm: Add more fields to bootm_info
  bootm: Move do_bootm_states() comment to header file
  booti: Avoid use of #ifdef
  bootz: Avoid use of #ifdef
  bootm: Drop arguments from do_bootm_states()
  bootm: Rename do_bootm_states() to bootm_run_states()
  bootm: Tidy up boot_selected_os()
  bootm: Create a function to run through the bootm states
  stm32: Use local vars in stm32prog for initrd and fdt
  bootm: Create a function to run through the bootz states
  stm32: Use bootm_run() and bootz_run()
  bootm: Create a function to run through the booti states
  bootm: Create a new boot_run() function to handle booting

 arch/arc/lib/bootm.c                          |   5 +-
 arch/arm/lib/bootm.c                          |   6 +-
 .../cmd_stm32prog/cmd_stm32prog.c             |  33 ++--
 arch/m68k/lib/bootm.c                         |   5 +-
 arch/m68k/lib/traps.c                         |   7 +
 arch/microblaze/lib/bootm.c                   |   6 +-
 arch/mips/cpu/cpu.c                           |   8 +-
 arch/mips/lib/bootm.c                         |   8 +-
 arch/nios2/cpu/cpu.c                          |   8 +-
 arch/nios2/lib/bootm.c                        |  10 +-
 arch/powerpc/lib/bootm.c                      |   5 +-
 arch/powerpc/lib/traps.c                      |  10 ++
 arch/riscv/cpu/cpu.c                          |  13 ++
 arch/riscv/lib/bootm.c                        |  11 +-
 arch/riscv/lib/reset.c                        |   7 +-
 arch/sandbox/cpu/cpu.c                        |   8 +
 arch/sandbox/lib/bootm.c                      |   5 +-
 arch/sh/lib/bootm.c                           |   6 +-
 arch/x86/lib/bootm.c                          |   6 +-
 arch/xtensa/lib/bootm.c                       |   4 +-
 boot/bootm.c                                  | 119 ++++++++-------
 boot/bootm_os.c                               |  78 +++++-----
 cmd/booti.c                                   |  55 ++++---
 cmd/bootm.c                                   |  43 ++++--
 cmd/bootz.c                                   |  35 +++--
 configs/sandbox_defconfig                     |   3 +-
 include/bootm.h                               | 142 ++++++++++++++++--
 27 files changed, 444 insertions(+), 202 deletions(-)

-- 
2.43.0.472.g3155946c3a-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

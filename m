Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 251F48136E9
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Dec 2023 17:51:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7FDCC6B45B;
	Thu, 14 Dec 2023 16:51:43 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36E66C6A61D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 16:51:42 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7b3a8366e13so347108539f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 08:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702572701; x=1703177501;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s+dxsgUPBLoTcoQWhp34wtg56IrCFS8NnHBImkU+8po=;
 b=glvKOtyqjhF5YtljvVkYy0smDoK+/pRnzKIS8WS7EsrtTfocfUTs0iEl7CUQ47LbtQ
 Ui9rfzM8tIPHVwiWyr4I/XKo29ciq502kVW2qmx+Lml5EH+yTw8rdarFttvW1YPCuJtj
 8IeuSB3pPZSEQKcjKSIasDoOdQIpZiCn7APGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702572701; x=1703177501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s+dxsgUPBLoTcoQWhp34wtg56IrCFS8NnHBImkU+8po=;
 b=bGN33M1pLxc5oW9yYbz3B7VS+aXS84/w2yeRGcmnRjB3mN5Ibkwy5F4VnihREA2gc9
 XjzPa/RlmaJlUcNcHodTYl17vMqJeoLeNke5TOG5+i9O83dBzV3z2x6/bacUv8Mvs1XS
 uamDecvj5pyYKmc2+b8rUXQPWotLRhI4OQ94sGDTwWNh8ExNR1XmxCeEDM8Mg+DQvqCz
 YLouJyx//UuJIXvHZygJv6jtTcPNNSmFaP+NPICiYPc3YZ/YiPqbIOcQClj2YoPz3Hsx
 2glQWdStclwtIO3KfxMKY6qJwbxXIdh08JsM7GIM8irTrlAo6AdhmnPAb+7s9vd1+7in
 635A==
X-Gm-Message-State: AOJu0Yyp+Zux9ahLREs/vdD8iafcPsIrDoyETRKT/ACRfepEm+jYo32Y
 fn4ccFgO25qT0Y0ehFLiunwzJQ==
X-Google-Smtp-Source: AGHT+IHS2iJlKsxPLqFzkMQCoWrul5SQ4wQK2/jFrYNWbggtR5tiixU+SyrMXiXWgPxymrcyV6WDRw==
X-Received: by 2002:a05:6e02:1b85:b0:35e:6b86:3c1e with SMTP id
 h5-20020a056e021b8500b0035e6b863c1emr14352739ili.34.1702572700998; 
 Thu, 14 Dec 2023 08:51:40 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 bn14-20020a056e02338e00b00357ca1ed25esm1228347ilb.80.2023.12.14.08.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 08:51:40 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Thu, 14 Dec 2023 09:50:09 -0700
Message-ID: <20231214165112.2182274-1-sjg@chromium.org>
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
Subject: [Uboot-stm32] [PATCH v2 00/21] Complete decoupling of bootm logic
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

Simon Glass (21):
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

 arch/arc/lib/bootm.c                          |   5 +-
 arch/arm/lib/bootm.c                          |   6 +-
 .../cmd_stm32prog/cmd_stm32prog.c             |  33 +++--
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
 arch/sandbox/cpu/cpu.c                        |   8 ++
 arch/sandbox/lib/bootm.c                      |   5 +-
 arch/sh/lib/bootm.c                           |   6 +-
 arch/x86/lib/bootm.c                          |   6 +-
 arch/xtensa/lib/bootm.c                       |   4 +-
 boot/bootm.c                                  | 133 ++++++++++--------
 boot/bootm_os.c                               |  78 +++++-----
 cmd/booti.c                                   |  55 +++++---
 cmd/bootm.c                                   |  43 ++++--
 cmd/bootz.c                                   |  35 +++--
 configs/sandbox_defconfig                     |   3 +-
 include/bootm.h                               | 124 ++++++++++++++--
 27 files changed, 440 insertions(+), 202 deletions(-)

-- 
2.43.0.472.g3155946c3a-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

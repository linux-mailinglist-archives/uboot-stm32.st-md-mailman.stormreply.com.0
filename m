Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B837802957
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Dec 2023 01:27:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FF18C6C855;
	Mon,  4 Dec 2023 00:27:03 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D55F4C6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 00:27:01 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-5bcfc508d14so1855826a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Dec 2023 16:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701649620; x=1702254420;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lt7lqo/R80Vzc2dGKtG5JaZ1IJx77c/da4liznlSojA=;
 b=PAI+F7N157Xjr6Yc5kdGPYlFebALHRyuV0aqm2edSf8b2bKFCGDkD+F/mT/v8UGqra
 9LSADSSxdRqDeqDLR/nG876pmxbsqe1w3kWdgiJ21fghekzYl/O7n1WmQYxfJ61VXpwn
 0GEuQkSMNe2gdq+vNdOdycNGluf4XUG2JDr2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701649620; x=1702254420;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lt7lqo/R80Vzc2dGKtG5JaZ1IJx77c/da4liznlSojA=;
 b=vEizyTysOTNuw11L0VtXPKGttv38hjYXVM0bNF0Q24itzYSPHwn7tHisiKIb82V+ud
 mMbMXOqCNq529FdpKt4L+13ej8UEbJXG7FHRrK+x/PgNLAxJdZJ6fuZnsSyilM1Ci1rM
 NF7IaUJTNkr535dpwJgMz7I1EMdbLKx03JSX8wX/f5e3dX94VmFyNYg31wGHxphj0DzR
 90O+eVV7cBaTkyGT7K3rXHD5DG7tF8vfOUvtU9gC2t4rQnMAQ3GU8dpAKyPFF/ZfvTwx
 1+PYUyuRU1Bo+DSjN8oXWxJhM2pyHMW7LzUkpYG2BOmqehDyN/q53cqmUyw4dzHcGzZT
 Z8/g==
X-Gm-Message-State: AOJu0YzuC2MaScgoxJYw7vQC5dbHcJBCDyv0Tv3zd2WhoszfzYgcNMAE
 f5Yg8PXwX7Lk9Q6IPfBbsFxyyQ==
X-Google-Smtp-Source: AGHT+IFfFxkG+TNrwktrxm61JgA3IwiaWUc+sbcLZNvMg1cQ3tjzrUmFYygzE8bH/OrKyIcqtXNQGQ==
X-Received: by 2002:a17:902:6946:b0:1d0:6ffe:a22 with SMTP id
 k6-20020a170902694600b001d06ffe0a22mr3035925plt.128.1701649620375; 
 Sun, 03 Dec 2023 16:27:00 -0800 (PST)
Received: from sjg1.roam.corp.google.com ([202.144.206.254])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170902904500b001cfb971edfasm7097227plz.205.2023.12.03.16.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 16:26:59 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun,  3 Dec 2023 17:26:16 -0700
Message-ID: <20231204002642.895926-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
MIME-Version: 1.0
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Eddie James <eajames@linux.ibm.com>, Rick Chen <rick@andestech.com>,
 uboot-snps-arc@synopsys.com, Max Filippov <jcmvbkbc@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Sean Anderson <sean.anderson@seco.com>,
 Thomas Chou <thomas@wytron.com.tw>,
 Angelo Dureghello <angelo@kernel-space.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Scott McNutt <smcnutt@psyent.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Alison Wang <alison.wang@nxp.com>,
 Safae Ouajih <souajih@baylibre.com>, Michal Simek <michal.simek@amd.com>,
 Leo <ycliang@andestech.com>, Nikita Shubin <n.shubin@yadro.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot Custodians <u-boot-custodians@lists.denx.de>,
 Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Chanho Park <chanho61.park@samsung.com>, Bin Meng <bmeng.cn@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [Uboot-stm32] [PATCH 00/18] Complete decoupling of bootm logic from
	commands
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


Simon Glass (18):
  bootm: netbds: Drop passing of arguments
  bootm: plan: Drop passing of arguments
  bootm: qnxelf: Drop passing of arguments
  nios2: Drop separate parsing of bootm args
  treewide: bootm: Drop command-line args to boot_os_fn
  bootm: Drop arguments from boot_selected_os()
  mips: Add a reset_cpu() function
  m68k: Add a reset_cpu() function
  ppc: Add a reset_cpu() function
  nios2: Add a reset_cpu() function
  riscv: Add a reset_cpu() function
  bootm: Adjust how the board is reset
  bootm: Drop arguments from do_bootm_states() and rename
  bootm: Create a function to run through the bootm states
  stm32: Use local vars in stm32prog for initrd and fdt
  bootm: Create a function to run through the bootz states
  stm32: Use bootm_run() and bootz_run()
  bootm: Create a function to run through the booti states

 arch/arc/lib/bootm.c                          |   2 +-
 arch/arm/lib/bootm.c                          |   3 +-
 .../cmd_stm32prog/cmd_stm32prog.c             |  35 +++--
 arch/m68k/lib/bootm.c                         |   3 +-
 arch/m68k/lib/traps.c                         |   7 +
 arch/microblaze/lib/bootm.c                   |   3 +-
 arch/mips/cpu/cpu.c                           |   8 +-
 arch/mips/lib/bootm.c                         |   5 +-
 arch/nios2/cpu/cpu.c                          |   8 +-
 arch/nios2/lib/bootm.c                        |   5 +-
 arch/powerpc/lib/bootm.c                      |   3 +-
 arch/powerpc/lib/traps.c                      |  10 ++
 arch/riscv/cpu/cpu.c                          |  13 ++
 arch/riscv/lib/bootm.c                        |   5 +-
 arch/riscv/lib/reset.c                        |   7 +-
 arch/sandbox/lib/bootm.c                      |   2 +-
 arch/sh/lib/bootm.c                           |   3 +-
 arch/x86/lib/bootm.c                          |   3 +-
 arch/xtensa/lib/bootm.c                       |   2 +-
 boot/bootm.c                                  | 125 ++++++++++--------
 boot/bootm_os.c                               | 101 +++++---------
 cmd/booti.c                                   |  55 ++++----
 cmd/bootm.c                                   |  36 +++--
 cmd/bootz.c                                   |  38 ++++--
 include/bootm.h                               | 107 +++++++++++++--
 25 files changed, 362 insertions(+), 227 deletions(-)

-- 
2.43.0.rc2.451.g8631bc7472-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

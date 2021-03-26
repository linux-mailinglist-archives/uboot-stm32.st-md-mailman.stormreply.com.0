Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA9B34A568
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Mar 2021 11:24:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E71AC57B79;
	Fri, 26 Mar 2021 10:24:36 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C491CC57B60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 10:24:35 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id l1so4310871pgb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 03:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mMViLiP16V63GqBJWFy8p0z9tNCGyKB0fctS/rfxvE0=;
 b=fCkxFiP+HaEsegxRiPVd/I/i0dIQHAtaz32FPMQbP2l5ZA+aABiDQV7cca1GIFn3SF
 DiMJkB8+/59UDVvC19ZtqzF3I7RuxsZs6Xtkn1sZOal61iE5z0esUsJi73cfrLtz8b4j
 B4bTRMr7l1kOT/TJXOAzUYuKHEdLDNNQu7bp1x2MPJSnWhnK7PfiOZB+/ECyNjhKsFo2
 bzTclolAJTpwjhKeETmen+tP+v/Ao1b5Up9sdt+trmwao+gePYnliom1ElHKW8/WrbnB
 4AxdvEAvVVEg1shlmLoonQgzgc4sgZKDfiC8+renuqBEyPIPZ78X7Ex4HJ/eRTaSgpzG
 UPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mMViLiP16V63GqBJWFy8p0z9tNCGyKB0fctS/rfxvE0=;
 b=UROgT28Cfw5hgQ9DTpk7STP81wWsNAwJlvG6xrZ/smkU39LgeYGIRpwKxG7Im1uGTx
 8bIAiRFayOp0eANWk5gnJJ2eUb95zPWL9FrYBA55FFdR38ULvbKz+HFVVs9w5dHlRsHP
 4AbLj0/UhH3jz2nmaudpruiXxR3IVeodoedPszBObHKvM1qyB6smU0z8YrUbA91WH57T
 WGm6JtFFarLV5dnXicMktTK9Xk7STRnfK/Z/zdn0Phg1qF80bC0xeH8DQ5R1zzQktrfp
 0+howyWhweYqdP3VbZNwj4SO+2U+q+Bx29tXe5Jr3rXiP1HJMBn5M4vrj7/Kg+o8rZxN
 BK6w==
X-Gm-Message-State: AOAM5334QhxnWpXUg5jjyJjojUhqaI1iZ4oU0uPoYNtOsZnswFSKobL1
 Jf/P4Tz3Zkxeu8xFNBwjGZY=
X-Google-Smtp-Source: ABdhPJznHMPfZ62DgKyw0fSbkSgIHcZsTRf7oVapAZSU0xdqJeDWhH6r7si4JN57ph0P6fKs4XKR8A==
X-Received: by 2002:a63:1e47:: with SMTP id p7mr11817427pgm.133.1616754274195; 
 Fri, 26 Mar 2021 03:24:34 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id ds3sm8126595pjb.23.2021.03.26.03.24.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 03:24:33 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Fri, 26 Mar 2021 18:24:21 +0800
Message-Id: <1616754267-13845-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 0/6] Add rt-thread art-pi board support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

These patches aim to adds u-boot support on art-pi board.

the board resources:
- stm32h750xbh6 128k flash, 1024k sram
- 32MiB sdram
- 16MiB spi flash
- 8MiB qspi flash
- onboard wifi, bt, fm

the detail board information can be found at:
https://art-pi.gitee.io/website/

---

changes in v2:
- fix wrong author/date in previous submit
- sync with kernel device tree files
- add st,stm32h750-pinctrl in doc and pinctrl driver

dillon min (6):
  ARM: dts: stm32: split sdram pin & timing parameter into specific
    board dts
  ARM: dts: stm32: Add RT-Thread art-pi board support
  board: Add rt-thread art-pi board support
  ram: stm32: fix strsep failed on read only memory
  dt-bindings: pinctrl: stm32: Add st,stm32h750-pinctrl for stm32h750
    soc
  pinctrl: stm32: Add st,stm32h750-pinctrl compatible string

 arch/arm/dts/Makefile                              |   3 +-
 arch/arm/dts/stm32h7-pinctrl.dtsi                  | 340 +++++++++++++++++++++
 arch/arm/dts/stm32h7-u-boot.dtsi                   | 100 +-----
 arch/arm/dts/stm32h743-pinctrl.dtsi                | 307 +------------------
 arch/arm/dts/stm32h743.dtsi                        | 168 +++++++++-
 arch/arm/dts/stm32h743i-disco-u-boot.dtsi          |  98 ++++++
 arch/arm/dts/stm32h743i-eval-u-boot.dtsi           |  98 ++++++
 arch/arm/dts/stm32h750-pinctrl.dtsi                |  11 +
 arch/arm/dts/stm32h750.dtsi                        |   5 +
 arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi         |  81 +++++
 arch/arm/dts/stm32h750i-art-pi.dts                 | 188 ++++++++++++
 arch/arm/mach-stm32/stm32h7/Kconfig                |   4 +
 board/st/stm32h750-art-pi/Kconfig                  |  19 ++
 board/st/stm32h750-art-pi/MAINTAINERS              |   7 +
 board/st/stm32h750-art-pi/Makefile                 |   6 +
 board/st/stm32h750-art-pi/stm32h750-art-pi.c       |  58 ++++
 configs/stm32h750-art-pi_defconfig                 |  51 ++++
 .../pinctrl/st,stm32-pinctrl.txt                   |   1 +
 drivers/pinctrl/pinctrl_stm32.c                    |   1 +
 drivers/ram/stm32_sdram.c                          |   3 +
 include/configs/stm32h750-art-pi.h                 |  48 +++
 include/dt-bindings/memory/stm32-sdram.h           |   2 +
 22 files changed, 1198 insertions(+), 401 deletions(-)
 create mode 100644 arch/arm/dts/stm32h7-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32h750-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32h750.dtsi
 create mode 100644 arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32h750i-art-pi.dts
 create mode 100644 board/st/stm32h750-art-pi/Kconfig
 create mode 100644 board/st/stm32h750-art-pi/MAINTAINERS
 create mode 100644 board/st/stm32h750-art-pi/Makefile
 create mode 100644 board/st/stm32h750-art-pi/stm32h750-art-pi.c
 create mode 100644 configs/stm32h750-art-pi_defconfig
 create mode 100644 include/configs/stm32h750-art-pi.h

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

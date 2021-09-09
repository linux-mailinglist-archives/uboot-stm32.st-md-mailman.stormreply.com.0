Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B134059C5
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Sep 2021 16:55:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EDC4C5A4D5;
	Thu,  9 Sep 2021 14:55:45 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71147C5718D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Sep 2021 14:55:44 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id y128so2818848oie.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Sep 2021 07:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8aeYZjl/m2ty9MkGEUVpVxnmVSEH55Xdo8rmPDIrcM8=;
 b=pggUQq0mlbT/Ph+Hg9+/1gHKoRFCPJIlNZLl4/moWeRkYJ37gbmyvO5MgW05aBd2x3
 a9DGosMaajqYdXVWhxDh5QgxCkH3kBnchkkCzzn2XSBbgorpfKOb00fij7W6cEn+Fyae
 QIoPc0m0++IbOVENY96mhjbklLlmL8QCx16QcYG2uKbPa4/8ISIDqJS4x+sOfwEjq3cF
 Vvw3JnHbzL71D3CUjXFLwRT5/GvZcy2r812Rp3qQsuqQx1HPcUCzjVHDu8MfUC2HBxNo
 8JC8v8iKulVFq8wHCWaSct5wt2Qocuy1pMZxSWlMzbzuTRFvpne6Z57rLnnpRmuON3c8
 e3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8aeYZjl/m2ty9MkGEUVpVxnmVSEH55Xdo8rmPDIrcM8=;
 b=A3oUBpdw9DE7GbAhBvmfH84jwl+N/72wWQtTT9cA0dmNwSdb2cKW2MkA0ahzctp03G
 DIDwdk9EglpFrVYEuFfE1UPGJx9xaAJ8PRKyDpR7pxxVXNVpxBDCtDPAF0ESHg2Vj4tY
 XcPYvTX4hVZNYDEOHKvqC60n6apM1bNa6OgwQgPoYn8gUuBLmxeb8INOuCxcpmIcz/en
 CSqgMKiFdlb8WlTFTHNAaOh76PqpSQ4YcmP5IT49rQTRSjRakBTpRp5Mlj1bDIqxHFL0
 qoT2Z64cWVbjDvpAWdWEUhQmlpoEkNLMGT9MRNl9Nxq9Z31fUP6FJK+z/0N3PxtOfF+z
 KapA==
X-Gm-Message-State: AOAM531FYfXKvPArW7ULJ3Yl62FJqDo02siK5bWjCo936i9oRJHCuFd5
 y6JRFo+SfyCzXyPghE7HpQg=
X-Google-Smtp-Source: ABdhPJzdYNI/Of/XZzweIk0l0jKyNE1ogeehY8ZyHE55o2/wS4SmL8/0LZQYB7u9Z9Me9Qxy617JMQ==
X-Received: by 2002:aca:670c:: with SMTP id z12mr157986oix.14.1631199343319;
 Thu, 09 Sep 2021 07:55:43 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id l21sm447898oop.22.2021.09.09.07.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 07:55:42 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de,
	patrick.delaunay@foss.st.com
Date: Thu,  9 Sep 2021 09:55:33 -0500
Message-Id: <20210909145536.2979951-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, marex@denx.de,
 etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH 0/3] stm32mp: Attempt to resolve unintended
	breakage with v2021.10-rc2
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

u-boot v2021.10-rc2 Introduced support for booting from FIP images
(not to be confused with FIT) for stm32mp. I am also working on a
different boot flow based on u-boot's falcon mode. The changes to
accommodate the FIP mode inadvertently broke the falcon flow. This
series intends to address that.

The core issue is that optee nodes are removed from the u-boot
devicetree. For reasons detailed in my other series
("[PATCH v2 00/11] stm32mp1: Support falcon mode with OP-TEE payloads")
the "optee" nodes are required.

It might seem like an obvious solution to "just re-add the nodes", but
I found out it didn't work like that. I couldn't use
STM32MP15x_STM32IMAGE to get me back my nodes, because that would have
required TFABOOT. What I needed was a new config that more accuratelyreflected the available boot flows.

STM32MP15x_STM32IMAGE is a confusing because it conflates image
generation with u-boot behavior. I'm proposing replacing it with
TFABOOT_FIP_CONTAINER because I think this new config is much easier
to understand in layman's terms. I also thinks it maps more elegantly
to what STM is trying to do: add a new boot flow.


Alexandru Gagniuc (3):
  stm32mp: Rename FIP config to stm32mp15_tfaboot_fip_defconig
  arm: Kconfig: Introduce a TFABOOT_FIP_CONTAINER option
  stm32mp1: Replace STM32MP15x_STM32IMAGE with TFABOOT_FIP_CONTAINER

 arch/arm/Kconfig                              | 15 ++++++++++++
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |  9 ++++----
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      |  9 ++++----
 arch/arm/mach-stm32mp/Kconfig                 |  7 ------
 .../cmd_stm32prog/cmd_stm32prog.c             |  5 ++--
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    |  4 ----
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  2 --
 arch/arm/mach-stm32mp/config.mk               |  2 +-
 arch/arm/mach-stm32mp/fdt.c                   |  4 +---
 .../arm/mach-stm32mp/include/mach/stm32prog.h |  2 --
 board/st/common/Kconfig                       | 23 ++++++++++---------
 board/st/common/stm32mp_mtdparts.c            | 20 +---------------
 board/st/stm32mp1/MAINTAINERS                 |  2 +-
 board/st/stm32mp1/stm32mp1.c                  |  6 ++---
 ...config => stm32mp15_tfaboot_fip_defconfig} |  1 +
 configs/stm32mp15_trusted_defconfig           |  1 -
 doc/board/st/stm32mp1.rst                     | 16 ++++++-------
 17 files changed, 54 insertions(+), 74 deletions(-)
 rename configs/{stm32mp15_defconfig => stm32mp15_tfaboot_fip_defconfig} (99%)

-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

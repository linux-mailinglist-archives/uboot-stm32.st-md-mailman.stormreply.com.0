Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DA6603967
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Oct 2022 07:56:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA688C64101;
	Wed, 19 Oct 2022 05:56:13 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A38D0C64101
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 17:48:45 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id q9so34203503ejd.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 10:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pzyOb/XIMWGKDy/zWkVmITsxFstivl0hhkn74dWXe7Q=;
 b=o1sQbEgwnrd3qFTYhNf77jZfqoMPAFWWowpjvFTUtQ6wtWZ5pxbPUyWMrh1GNny2+m
 U25trp4dwzEHtjcl3hJ1WRZunTCNttHIoL0E/NTn+VTpPuzn27BXTV7FKbWwg0tIATgp
 Arwt+uoGmE3y3NWaRSTo+JWfpMwLrYpJvm4rxZhs47Uts9r6oXmHn7GGhDTi185X+Rcz
 TKNn7qRreH1xJMpV9sSiB8wGJumvidzlmiUhFpJ+caio9NrzNjeFtRzY+a5IwLn+fHjr
 F6npX1t7vbr1jBPUf9bVnkwPpWK1yaFTcBIJhXgyCA3YLyfvjHWArcMjydAirqaR4tSV
 CkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pzyOb/XIMWGKDy/zWkVmITsxFstivl0hhkn74dWXe7Q=;
 b=Euy62TuvBiyf4sFpaQ+BWdXWq/gbqkVOx9OHlju6j033G2zVA0RjV2FUXyOjaxZfGe
 0wIiSPOVUe3I3E0PzmyTJ3LcNL82HnwrmpaonlEFSoVbnnEkSaabJmarCf+JbWBwloCv
 6h4hHsU7aq3r8Nm52Mkvr2YLkGXA3H7+lMudIoof/KJ9tV10XtB8c+bQWN+2GTCv9Vs4
 iHVmj/O2ncoQoP/eTuS7HRozDaVVg6g530b/L8tkvm1L9tSTLfUEq6UKrpzKaOXJiLuS
 4ZSeKcuXq7Tl+dP6FR7Nx/fIfeczizD1rYWdxW2JWGfM0yHs52b4SRu9LzABTfogRR6p
 //yQ==
X-Gm-Message-State: ACrzQf0F8+LQSOtmHFtrmZOaWDhCMg3Q47nlibbuXYGi6v24N2UDlFdM
 CBDKj1Xrn1pV+m1gHHwxGMo=
X-Google-Smtp-Source: AMsMyM6YgywBpI2wM0YaJ/y46osiX8/taosREOGIa/Qdo6SR3W65IY+7UEQB9jtsIoQwp3EPlSeGtg==
X-Received: by 2002:a17:907:1b1e:b0:783:8e33:2d1c with SMTP id
 mp30-20020a1709071b1e00b007838e332d1cmr3428787ejc.304.1666115325047; 
 Tue, 18 Oct 2022 10:48:45 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 u22-20020a056402111600b00458dc7e8ecasm9227098edv.72.2022.10.18.10.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 10:48:44 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: u-boot@lists.denx.de
Date: Tue, 18 Oct 2022 19:48:27 +0200
Message-Id: <20221018174827.1393211-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Oct 2022 05:56:12 +0000
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Adam Ford <aford173@gmail.com>
Subject: [Uboot-stm32] [PATCH] Makefile: fix u-boot-initial-env target if
	lto is enabled
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

From: Max Krummenacher <max.krummenacher@toradex.com>

With LTO enabled the U-Boot initial environment is no longer stored
in an easy accessible section in env/common.o. I.e. the section name
changes from build to build, its content maybe compressed and it is
annotated with additional data.

For GCC adding the option '-ffat-lto-objects' when compiling common.o
adds additionally the traditional sections in the object file and
'make u-boot-initial-env' would work also for the LTO enabled case.
However clang doesn't have that option.

Fix this by recompiling common.o into a object file only used for
the creation of u-boot-initial-env if LTO is enabled.

See also:
https://lore.kernel.org/all/927b122e-1f62-e790-f5ca-30bae4332c77@foss.st.com/

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Makefile b/Makefile
index 3866cc62f9a..cd45c720d23 100644
--- a/Makefile
+++ b/Makefile
@@ -2451,9 +2451,17 @@ endif
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
 quiet_cmd_genenv = GENENV  $@
+ifeq ($(LTO_ENABLE),y)
+cmd_genenv = $(CC) $(filter-out $(LTO_CFLAGS),$(c_flags)) -c -o env/initial_env.o env/common.c; \
+	$(OBJCOPY) --dump-section .rodata.default_environment=$@ env/initial_env.o; \
+	sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s*$$/d' $@; \
+	sort --field-separator== -k1,1 --stable $@ -o $@; \
+	rm -f env/initial_env.o env/initial_env.su
+else
 cmd_genenv = $(OBJCOPY) --dump-section .rodata.default_environment=$@ env/common.o; \
 	sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s*$$/d' $@; \
 	sort --field-separator== -k1,1 --stable $@ -o $@
+endif
 
 u-boot-initial-env: u-boot.bin
 	$(call if_changed,genenv)
-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLoMCUQPyGl+ggUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sat, 28 Mar 2026 18:26:28 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A6F34F560
	for <lists+uboot-stm32@lfdr.de>; Sat, 28 Mar 2026 18:26:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1F37C36B30;
	Sat, 28 Mar 2026 17:16:48 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D708C36B12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 17:16:48 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-486fb439299so28884815e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 10:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1774718208; x=1775323008;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n69iOfCx8r/tYYbLWbMgDiByJOAylNkX67zhneWbYew=;
 b=Tk+Z/RP7nhxxHatdujQoENDNZorgvcp1s8GXlsg+RI7Bwu3/M2dGmfKN+DggqTN1SC
 +VpjpaSfwxZaSjopsCgUaUzCx3Q6vXiub4ERFKFBqqMFVL+B3yDZDO7T7aLmW1yUNuJg
 Q75Aa7lA5qaEX1P8L4su2GeVP4KwAX/CJpnlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774718208; x=1775323008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n69iOfCx8r/tYYbLWbMgDiByJOAylNkX67zhneWbYew=;
 b=DJTS/bQSrSqQT+3ZtcvwcqmLbhY6TrbI2e7Q21b4J0YzegbmeiISmq4juurRzod/Sw
 n11yfhGzTlvCrATJb+fWRwmJxyakRoEfILzfaJ7vQd7PhqCpB8FkFOD+fcAtf7C/NSP8
 /0ujwMttbKRfSPxo3gsoatMUEBgr/1LNQGGCLZQSiVuWec7dv3yVI74aBSSKQCsawgGT
 44PEXoP94h3WCQ7x07/wQYdnGg1X+ca5Bi78nqfIoKhZQr1rUVIyrSjrzTzFdFPF1zjS
 cjIMPZPfy1Ll9/5VJZzOnhhgceYESg5VdRu8pJ3KtTWX3YfGNfo4HwOni23rVkQpqC5w
 7FlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNw3qeCRgztcz4xD0Xsg1twc3KY2Y8nhV6XXj6Xc+a+aDYESUlkSO4p9LT7YuP1s6AARH+mYVTkOGBBQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwJtt0l5nhuVHXxMBgI3SQGO/Il4F1b2nPC2ePj12UAvfQW9epZ
 h7jg5xx+2muyQsmaooARtyHpgbEoh/YT8EUP+J/nMqes6A3/pk5M0o4IlpFiaHUgEho=
X-Gm-Gg: ATEYQzx9uZOmva2b/Gmud7uSu9ogBYO+qxGl9tZ2mt+Fd4zo1XVQ8uBOjUMAWYaMOYe
 asV7C9TkocJ76n1SHwiVMOkDMD6fO6V9bQ/FY/CveCWJM2oUpCZQXfJAer3rq/nM4GKWOkcLjqq
 KU4mk3UdL6YxSNBWGtEYOLV4hZkQGtrzMyJ5ISlZEdJCGVvdVssuY+yFc2dftn8nm53VdguFFMg
 tmQgXK1D29dzhDXey/hfFo/1PSdvZ5bxgs0r12SZp1bFpPEj9VYdAbB3U3hAdHyIMRNUzAebPaA
 WiDDnJt9gSPRa05zlJ/+11TZ7W2fRDmGdosTz/vklot5YOU+W1l54lv2ZC1unygVH4cXvctuTza
 +q8UNhlyvhWie9GYI9MPbbi9vBuIo43p643SEGwNQZEnVsgZzK3u0fmvHFbPKM955AtlnnmwVuB
 eqxlQwKZjHvTglr57HFPoxsSJqk992Gy3DulgrtJ3dSsufrCvkym2gznGmPz7vqD8Qv1wC+Bb4c
 dXRgr9jpkilAONifhslpW21P3qhrw890fhpWfLZKnxY9kBQxMZZ7yHokPc9njvZOColgeWjR5FR
 yBiwWlaA2UpBjRVsiCz5A0K+HJk8DA0TlSA=
X-Received: by 2002:a05:600c:1d1e:b0:486:fc95:1a91 with SMTP id
 5b1f17b1804b1-48727f2373dmr111216915e9.12.1774718207528; 
 Sat, 28 Mar 2026 10:16:47 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-100-184.retail.telecomitalia.it. [87.9.100.184])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c6b105sm332432465e9.1.2026.03.28.10.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2026 10:16:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat, 28 Mar 2026 18:15:13 +0100
Message-ID: <20260328171624.2377527-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Rasmus Villemoes <ravi@prevas.dk>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sughosh Ganu <sughosh.ganu@arm.com>, Padmarao Begari <padmarao.begari@amd.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Michal Simek <michal.simek@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 0/4] Support metadata-driven A/B boot for
	STM32MP25
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[konsulko.com,mailbox.org,arm.com,gmx.de,prevas.dk,linaro.org,redhat.com,amd.com,st-md-mailman.stormreply.com,cherry.de,foss.st.com,chromium.org,amarulasolutions.com];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:vincent.stehle@arm.com,m:xypron.glpk@gmx.de,m:ravi@prevas.dk,m:ilias.apalodimas@linaro.org,m:javierm@redhat.com,m:sughosh.ganu@arm.com,m:padmarao.begari@amd.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:michal.simek@amd.com,m:quentin.schulz@cherry.de,m:patrick.delaunay@foss.st.com,m:sjg@chromium.org,m:dario.binacchi@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	NEURAL_SPAM(0.00)[0.956];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,amarulasolutions.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: C2A6F34F560
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series, the mainline version of [1], provides the necessary changes
in U-Boot to support the metadata-driven A/B update flow for STM32MP25
boards. It implements the logic required to dynamically select the boot
bank based on FWU metadata.

These changes are designed to be backward compatible while providing
the necessary infrastructure for the A/B scheme.

The series has been tested on the STM32MP257F-EV1 board.

Additionally, patches 1 to 3 propose some changes with general-purpose
utility:

 1/4 fwu: add helper to get image GUID by type and bank index
 2/4 cmd: part: support lookup by UUID in 'part number'
 3/4 lib: uuid: add partition type GUID for extended bootloader

[1] https://github.com/STMicroelectronics/u-boot/pull/6


Dario Binacchi (4):
  lib: uuid: add partition type GUID for extended bootloader
  cmd: part: support lookup by UUID in 'part number'
  fwu: add helper to get image GUID by type and bank index
  board: st: stm32mp25: support dynamic A/B bank bootup

 board/st/stm32mp2/stm32mp2.c          | 25 +++++++++++++++++++++++++
 cmd/part.c                            |  8 ++++++--
 doc/README.gpt                        |  2 ++
 include/configs/stm32mp25_st_common.h | 15 +++++++++++++++
 include/fwu.h                         |  3 +++
 include/part_efi.h                    |  3 +++
 lib/fwu_updates/fwu.c                 | 24 ++++++++++++++++++++++++
 lib/uuid.c                            |  1 +
 8 files changed, 79 insertions(+), 2 deletions(-)

-- 
2.43.0

base-commit: c704af3c8b0f37929bce8c2a4bba27d6e89919c7
branch: fwupdate-ab
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

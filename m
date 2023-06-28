Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A76A741036
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Jun 2023 13:41:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5516C6B443;
	Wed, 28 Jun 2023 11:41:55 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C97BBC03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jun 2023 11:41:53 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-51d97ba7c01so4066794a12.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jun 2023 04:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687952513; x=1690544513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J3fCXuZxswcmQDhhHXP0B2fP2u2I6MAR6fPt8D4fAFk=;
 b=R3tIWpYUjM7IbcynYydSaP3Y2AAPJLoCS+CqJWUe+An7GY47ZhLkcUGyOxe8NhPirx
 VwcLvlaJlUhzcZLUg9NdBeeJFQTVetF8Ryno6ZuNzT1HWsllb+e96NQEMv1tjU7LWLcA
 44ySlOGWq1kV1XuF2JieLmdp9ct6xPcGm/zWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687952513; x=1690544513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J3fCXuZxswcmQDhhHXP0B2fP2u2I6MAR6fPt8D4fAFk=;
 b=PwQrtZDI1A3TrHqJF8QdaCRqStmiN/rQ3FCdsako9bPKXazCbJj4OTcZ1qKqxecf+B
 UJ7At/sSvHysJlrY6cfI0daXT9m0T6dIIdTZIqy2cZpWlU8+OvGIG7zW8z7mXHgLw7kv
 NaO6HjboaBtHYVYNo/DXkFuNg0/UoMl21F3cf6qjoQSbl5AhnYlPwE+D7+4228x3trSC
 jEOBqjlZIkmSdNuP8kK858woEIixceknySME5CIRPWTGB7OUUhcCfJScLvFQSJSr9Yqs
 Mw1UhI5mRh4+UNnUUMa6l7BQkksjZQS+gkiEfxMTW+E6UttQ637I3yZ9loUec6jetglK
 B+yA==
X-Gm-Message-State: AC+VfDwEyjV0sceUL4gw8shl6UsF0sdNIZl/6mIM2u9wd4dqRXmu5z3m
 UFfVvhsSXcg1f2CTBjxtt6yOLg==
X-Google-Smtp-Source: ACHHUZ7LYFB9+usECirmh5WHYUn8lCNMwpBOb5PZ991g9ElFXWkbjXQ+n21dSwetl1gbB/PX1nXdAw==
X-Received: by 2002:aa7:c685:0:b0:51d:d2c7:70e3 with SMTP id
 n5-20020aa7c685000000b0051dd2c770e3mr569073edq.42.1687952513092; 
 Wed, 28 Jun 2023 04:41:53 -0700 (PDT)
Received: from sjg1.praguecc.cz ([193.85.242.128])
 by smtp.gmail.com with ESMTPSA id
 r18-20020aa7cb92000000b0051bec856cb4sm4676423edt.50.2023.06.28.04.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 04:41:52 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Wed, 28 Jun 2023 12:41:33 +0100
Message-ID: <20230628114149.439723-1-sjg@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jan Kiszka <jan.kiszka@siemens.com>,
 Simon Glass <sjg@chromium.org>, Neha Malcom Francis <n-francis@ti.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Ivan Mikhaylov <fr0st61te@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 00/12] binman: Simple templating feature and
	mkimage conversion
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

This series converts the mkimage entry type to be a section, i.e. based on
the entry_Section class. This makes it more consistent in its behaviour,
e.g. allowing symbol writing and expanded entries.

A simple templating feature is also introduced, to reduce duplication
when a set of entries must be used in multiple images.

The templating implementation works by appending the template nodes to
the target node. It is probably better to insert the template nodes
before any subnodes in the target, so that the ordering of nodes in the
template is preserved. But that involves rewriting the Fdt classs, since
it can currently only add a subnode after the existing ones. This is left
for later.


Marek Vasut (1):
  binman: Convert mkimage to Entry_section

Simon Glass (11):
  binman: Init align_default in entry_Section
  binman: Use GetEntries() to obtain section contents
  binman: Read _multiple_data_files in the correct place
  binman: Allow disabling symbol writing
  stm32mp15: Avoid writing symbols in SPL
  binman: Provide a way to specific the fdt-list directly
  binman: Drop __bss_size variable in bss_data.c
  binman: Correct handling of zero bss size
  dtoc: Support copying the contents of a node into another
  dtoc: Allow inserting a list of nodes into another
  binman: Support simple templates

 arch/arm/dts/stm32mp15-u-boot.dtsi        |   1 +
 tools/binman/binman.rst                   |  87 ++++++++++++++++++
 tools/binman/control.py                   |   9 ++
 tools/binman/elf_test.py                  |   5 ++
 tools/binman/entries.rst                  |   6 ++
 tools/binman/entry.py                     |  10 +--
 tools/binman/etype/blob_phase.py          |   5 ++
 tools/binman/etype/fit.py                 |   9 ++
 tools/binman/etype/mkimage.py             |  79 ++++++++++-------
 tools/binman/etype/section.py             |  22 ++---
 tools/binman/etype/u_boot_spl_bss_pad.py  |   2 +-
 tools/binman/etype/u_boot_tpl_bss_pad.py  |   2 +-
 tools/binman/etype/u_boot_vpl_bss_pad.py  |   2 +-
 tools/binman/ftest.py                     | 103 +++++++++++++++++++++-
 tools/binman/test/282_symbols_disable.dts |  25 ++++++
 tools/binman/test/283_mkimage_special.dts |  24 +++++
 tools/binman/test/284_fit_fdt_list.dts    |  58 ++++++++++++
 tools/binman/test/285_spl_expand.dts      |  13 +++
 tools/binman/test/286_entry_template.dts  |  42 +++++++++
 tools/binman/test/Makefile                |   5 +-
 tools/binman/test/bss_data.c              |   3 +-
 tools/binman/test/bss_data_zero.c         |  16 ++++
 tools/binman/test/bss_data_zero.lds       |  15 ++++
 tools/binman/test/embed_data.lds          |   1 +
 tools/dtoc/fdt.py                         |  38 ++++++++
 tools/dtoc/test/dtoc_test_simple.dts      |  13 ++-
 tools/dtoc/test_fdt.py                    |  61 +++++++++++++
 27 files changed, 599 insertions(+), 57 deletions(-)
 create mode 100644 tools/binman/test/282_symbols_disable.dts
 create mode 100644 tools/binman/test/283_mkimage_special.dts
 create mode 100644 tools/binman/test/284_fit_fdt_list.dts
 create mode 100644 tools/binman/test/285_spl_expand.dts
 create mode 100644 tools/binman/test/286_entry_template.dts
 create mode 100644 tools/binman/test/bss_data_zero.c
 create mode 100644 tools/binman/test/bss_data_zero.lds

-- 
2.41.0.162.gfafddb0af9-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

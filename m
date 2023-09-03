Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DC0790DE2
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:33:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1010AC6B44E;
	Sun,  3 Sep 2023 20:33:58 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32C3BC6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:33:56 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-99cce6f7de2so122905766b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693773235; x=1694378035;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MfgAoKBXdr0ffk+hI2szmkH0t+Jsl/5VVXdkefd/DFM=;
 b=j5GhcZiv47eL1hY22rhBlp0NXiT9JIvd1irUt07O/0eP2dxd8TBLpmEyD/5YisAY5k
 F/7PtY+j2tr3LT0vBlxnoSVirmKpNma2KG0TJOlU/zHnjuLcuRoSxKhtFfdIf/eO3LiY
 UX3I/pIx1aM6GThhsPO4lmekMQfLJJO9Ls8eM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693773235; x=1694378035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MfgAoKBXdr0ffk+hI2szmkH0t+Jsl/5VVXdkefd/DFM=;
 b=GXqo3I1YIadbjrcO84+O4Hkd5X2+xXPMXhBiSSP3u5OYrm2c3zl1sOJAp9utLFEymB
 tmgD0LbfoVHGOkkylsugpXJ6YBEiRM2ndqkCUVQU+WIXvMKZ3PrmLXMEGuM3wGTUK1EE
 qvVCgkLWWuS44KDtMNOCqtJfRB/XDH2VCMGh5/Ag3IaFAaCn79Xgv+snGnk8xNhkiqLf
 a0ihbs1q3p06WiABF0ng1vvPDKQ6hOn71pdBEbc72txu6MOQaFMMc25C1V6BMXtCvVPL
 FUGLq490nC7ZBhNQL1spUfaiCJ+5NSTBg5HRyLkb/vvWOEgicqvRa6kp0JdFCBQY5PS+
 2WiQ==
X-Gm-Message-State: AOJu0Yz6DsKO8mT1H0sNrOKJtwNkoAv1hYNM2nHDc+MOyK49ppuvzAHa
 QVynhbLAghhd48tFnlbeNYyayg==
X-Google-Smtp-Source: AGHT+IF62TAhgSU6/v4/MFcYmpj0LkMfWdF7nDE1CEB7CQ0rDA5ykvy6Hu5Ck8d7s1B5MdXOjN49ew==
X-Received: by 2002:a17:906:29e:b0:9a2:23cd:f05a with SMTP id
 30-20020a170906029e00b009a223cdf05amr6745014ejf.76.1693773235591; 
 Sun, 03 Sep 2023 13:33:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 pw9-20020a17090720a900b0098884f86e41sm5103232ejb.123.2023.09.03.13.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:33:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:33:49 +0200
Message-Id: <20230903203352.658691-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 0/3] ARM: dts: stm32f429 sync with Linux
	kernel 6.5
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

This series contains my patches on the device tree for stm32f429 platform
that have already been merged into the mainline of Linux. Since they applied
perfectly, I preferred not to merge them into a single patch, which would have
been less readable.


Dario Binacchi (3):
  ARM: dts: stm32: add CAN support on stm32f429
  ARM: dts: stm32: add pin map for CAN controller on stm32f4
  ARM: dts: stm32f429: put can2 in secondary mode

 arch/arm/dts/stm32f4-pinctrl.dtsi | 30 ++++++++++++++++++++++++++++++
 arch/arm/dts/stm32f429.dtsi       | 30 ++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

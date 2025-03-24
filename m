Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEED0A6E1EA
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Mar 2025 19:00:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0400C7802F;
	Mon, 24 Mar 2025 18:00:53 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25029C7801E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 18:00:52 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-399744f74e9so2893094f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 11:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1742839251; x=1743444051;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wvZkbdIVJrvV3lWjV8CcOLAFsC9LTMIZ/snWkKCGynU=;
 b=oWl8nmF7P/VO8SUyq2AfnY5dTsxKjg2G8504Jo84RllL+LVICDjqtoaTE7HZifv+U2
 nsbEHaVNePPRl1C7sUKLShjjyzvkQsomVdquR8ErntuqS7iB/OulESgBglI1mFM4PCIE
 o+4w/Ca5P1Xv+zuyF1fGAHtWo6+qCEBUwvYQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742839251; x=1743444051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wvZkbdIVJrvV3lWjV8CcOLAFsC9LTMIZ/snWkKCGynU=;
 b=h/+lEPGzQnTtC3kBmXxrnZ1fdZxibuTXpyt6qJERFONqRLbYhD2/UbZ1yLYNHMY6kx
 9aJrHWqI7hjvucUwA8gtQNPs277FgYJeud9rFyKE5w4VDpvvZNjWkKtZmFQ6rRLVrb9K
 nV7jkAqvyznaTWyMu2xpiCfU0eddzh7tjZRkKl3yhph2WFN+D4hF50DsIHTXyHMwGJ/z
 7H2yTgpHqA95JZ2L+wD0OQEHGovMnnpSD5gNg5/BfXxl7FYNsQYBkl/zwjFkY4LoUMPD
 8fWT7xe+mB9Y8oUK99cJhRXyN/QeQdlpU4KJ3F6q8Au3Hl5TXX3IAb5TmclWIugHJm5O
 ckBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCzhI3UrLhKYi0DbhdwQ0L6KtrnnZju1yuJrS+VUtnfM6nWbzon2mDnTcl7KFyn5f62pdsEu3uMFepWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxECmkOMVJ0zC4JTBgs8mb9Da7Ax0YgeXycxZFrN/GYDyWtJkf+
 mf8kAnsY0RwMSMwOFUVvs3aBM3oMxDLnVX/iIJG6qar0n6a+Fh6E5xqMOJUx+OI=
X-Gm-Gg: ASbGncsBwREACLDrqjjoffGNIaCpGQtIQvkA8bx1pDLM8zBJgVZwEybisM9OXXi49qs
 LXGMQwaWAIHQ6oiMoDaea85gItP7vtfdnW18D0rgviUSWlHiNRvAXRgRjD4AN/116Y/Wz8qpSYH
 XNVnBh+UK7TFcU3ZgX2KvD0yG2/RmWHWqAKg4RRPaTb6TdOgZH22pTIG6wkAe11BNXLVD8vLyWZ
 HcuC9H+vKfcUo8fbjQlgEupVInVdc017Jxta2RzIXzHEpTKUCjd/cFtNkXlKsAuad+60cLKmLmK
 Zn7KgZwJst30ptRVVC2CoJy/7I2aCrB9kMhfz3QoDIedvMRU/CQdYXmvr0KPCTbv3JiJvRdc/Mh
 B4hmtwdroJwo7v/MpU/pF/cBJtNdL1oZXik0L2Ys6wfqt5w==
X-Google-Smtp-Source: AGHT+IFE3sqzz3pMNpS8wslP0hPUlHnZYsoJH7+sxSVP27VDeaqlw1/+1/CPE862u8GRrWPxmIGTuw==
X-Received: by 2002:a05:6000:1f8f:b0:391:43ff:8ca8 with SMTP id
 ffacd0b85a97d-3997f91e0d1mr12339564f8f.26.1742839251080; 
 Mon, 24 Mar 2025 11:00:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.220])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556a4sm178289285e9.22.2025.03.24.11.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 11:00:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 24 Mar 2025 19:00:24 +0100
Message-ID: <20250324180047.1571378-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Fabio Estevam <festevam@denx.de>, Kever Yang <kever.yang@rock-chips.com>,
 Anton Bambura <jenneron@protonmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Tom Rini <trini@konsulko.com>, Tony Dinh <mibodhi@gmail.com>,
 Anatolij Gustschin <agust@denx.de>, Vikas Manocha <vikas.manocha@st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Jonas Karlman <jonas@kwiboo.se>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andre Przywara <andre.przywara@arm.com>, Sumit Garg <sumit.garg@kernel.org>,
 Prasad Kummari <prasad.kummari@amd.com>, Adam Ford <aford173@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 0/6] Support NT35510 panel controller on
	stm32f769i-disco board
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

The series, inspired by some of my patches already merged into Linux,
adds support for the Novatek NT35510 panel on the stm32f769i-disco
board. Indeed, the MB1166 board comes in different hardware revisions.
The MB1166-A09 is utilizing a NT35510 panel controller while prior
versions are utilizing an OTM8009a controller.


Dario Binacchi (6):
  ARM: dts: stm32: add DSI support on stm32f769
  ARM: dts: stm32: rename mmc_vcard to vcc-3v3 on stm32f769-disco
  ARM: dts: stm32: add display support on stm32f769-disco
  ARM: dts: add stm32f769-disco-mb1166-reva09
  video: support FRIDA FRD400B25025-A-CTK
  board: stm32f769-disco: support FRD400B25025-A-CTK display

 arch/arm/dts/Makefile                         |    1 +
 .../stm32f769-disco-mb1166-reva09-u-boot.dtsi |    6 +
 .../arm/dts/stm32f769-disco-mb1166-reva09.dts |   13 +
 arch/arm/dts/stm32f769-disco-u-boot.dtsi      |   53 +-
 arch/arm/dts/stm32f769-disco.dts              |   66 +-
 arch/arm/dts/stm32f769.dtsi                   |   20 +
 configs/stm32f769-disco_defconfig             |    2 +
 configs/stm32f769-disco_spl_defconfig         |    2 +
 drivers/video/Kconfig                         |    7 +
 drivers/video/Makefile                        |    1 +
 drivers/video/novatek-nt35510.c               | 1253 +++++++++++++++++
 11 files changed, 1374 insertions(+), 50 deletions(-)
 create mode 100644 arch/arm/dts/stm32f769-disco-mb1166-reva09-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32f769-disco-mb1166-reva09.dts
 create mode 100644 arch/arm/dts/stm32f769.dtsi
 create mode 100644 drivers/video/novatek-nt35510.c

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF557FB28
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Jul 2022 10:20:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44699C5C829;
	Mon, 25 Jul 2022 08:20:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE8A1C03FC0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jul 2022 08:20:03 +0000 (UTC)
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 59E7E84163
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jul 2022 10:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658737203;
 bh=FYyso3H5AzwQv5Hugs1cnrqVLa7FvFN7f5E37wGIUD0=;
 h=From:To:Cc:Subject:Date:From;
 b=Q9axtljvVMmpDQ0LLTdTj7rLDuCGRkwvbjbWpd7u/akJg5Mb9Lkja/jcW1IXSeYLO
 Q3cJedHJaCmKb8GgRHOtRN0E3T+RIEiFWYQW/yudoki3sfZqFTWIj6T0WZ8LJJzcHr
 XSi4eY28xdeXn+m2xhQuUko6SPB2IIqlGbaL7C3AZV6eVi/mMQpX6Izdt0F0ABut4o
 Aml0/iKLZGKXYqZZzTc3wORwmudQF73aT7cJYHpHNjtj7fThBWvpb80Pn4FhmBHIjK
 mCkZofwOoNZDI6QSZ2Yv6TEzbD5/d4JnGDLyoLz1JlASMLqiql6YyzKPEGMlOAx30m
 //KFpgSRdzi8w==
Received: by janitor.denx.de (Postfix, from userid 108)
 id EAE29A025A; Mon, 25 Jul 2022 10:20:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on janitor.denx.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.2
Received: from xpert.denx.de (xpert.denx.de [192.168.0.4])
 by janitor.denx.de (Postfix) with ESMTPS id 404C5A00A5;
 Mon, 25 Jul 2022 10:19:59 +0200 (CEST)
Received: by xpert.denx.de (Postfix, from userid 535)
 id BBC793E006E; Mon, 25 Jul 2022 10:19:58 +0200 (CEST)
From: Philip Oberfichtner <pro@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 25 Jul 2022 10:19:46 +0200
Message-Id: <20220725081950.25452-1-pro@denx.de>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, peng.fan@nxp.com,
 festevam@denx.de, u-boot@dh-electronics.com, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Philip Oberfichtner <pro@denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>, sbabic@denx.de
Subject: [Uboot-stm32] [PATCH v3 0/4] Deduplicate dhelectronics board files
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


This series unifies common MAC address code for imx6, imx8 and stm32
based boards by DH. It is thought of as a starting point for more
deduplication in the future.

Changes in v3:
        - Entire series reviewed by Marek

Changes in v2:
        - Tested-by Marek
        - convert to livetree (rebase on commit 5a605b7c86152)
        - Fix spelling

Philip Oberfichtner (4):
  board: dhelectronics: Implement common MAC address functions
  ARM: imx6: DH: Use common MAC address functions
  ARM: imx8: DH: Use common MAC address functions
  ARM: stm32: DH: Use common MAC address functions

 board/dhelectronics/common/Makefile           |  10 ++
 board/dhelectronics/common/dh_common.c        |  65 ++++++++++
 board/dhelectronics/common/dh_common.h        |  28 ++++
 board/dhelectronics/common/dh_imx.c           |  24 ++++
 board/dhelectronics/common/dh_imx.h           |  12 ++
 board/dhelectronics/dh_imx6/dh_imx6.c         |  47 ++-----
 .../dh_imx8mp/imx8mp_dhcom_pdk2.c             | 121 +++++++-----------
 board/dhelectronics/dh_stm32mp1/board.c       | 102 +++++++--------
 8 files changed, 246 insertions(+), 163 deletions(-)
 create mode 100644 board/dhelectronics/common/Makefile
 create mode 100644 board/dhelectronics/common/dh_common.c
 create mode 100644 board/dhelectronics/common/dh_common.h
 create mode 100644 board/dhelectronics/common/dh_imx.c
 create mode 100644 board/dhelectronics/common/dh_imx.h

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

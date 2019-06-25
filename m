Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F28A527FA
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 11:24:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D852D12B81
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 09:24:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D26EBD12B80
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 09:24:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P9CwsC004435; Tue, 25 Jun 2019 11:24:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=eOHGQzhTUKlEKW1awZqGG2rmxMHXqskhYCUCAfBuzlI=;
 b=SdzspvQWVHvxTmVikW0XsZIUkLs+5B5t2zxViGrSN9vt0iXB/6GRvxEFp6pgjMAUx5DQ
 n1Q2wru7yz7aZhfADoNVjb04iqS7DdAv0iyxXG9fXN/5UvgsW9kv+HEKufn0sjioGY0Z
 H5nhjAoUAkONA1qiOdxmKpNkVf0/e+Y7h3/cDW2/TqrE3Lbbk+yr+4W773MLgJ62+08U
 YIG+lbm+qTnX0Q6ABXpchZi8lbE1MZgWL6zm3k1ba0Vu68SY7O3PvK/omO8jbfJYjqkG
 uVlpkwfszzVf/5rPZEKA5nsxFK5pav30Wz7UlbnnOZKArfIOpKLcAws40Nu0brEYGtIa Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t9d2wgg88-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 11:24:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DDCDA31;
 Tue, 25 Jun 2019 09:24:17 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C57021333;
 Tue, 25 Jun 2019 09:24:17 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 25 Jun
 2019 11:24:17 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 25 Jun 2019 11:24:17
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <patrick.delaunay@st.com>, <patrice.chotard@st.com>, <sjg@chromium.org>
Date: Tue, 25 Jun 2019 11:23:59 +0200
Message-ID: <20190625092401.4573-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_06:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [Uboot-stm32] [PATCH 0/2] Add RTC driver for STM32MP1
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

This series add support of RTC driver for stm32mp1 SoC.
First it adds the missing clocks for RTC hadrware block and after
the driver itself (enabled for basic and trusted configurations).

Benjamin Gaignard (1):
  rtc: Add rtc driver for stm32mp1

Patrick Delaunay (1):
  clk: stm32mp1: Add RTC clock entry

 configs/stm32mp15_basic_defconfig   |   2 +
 configs/stm32mp15_trusted_defconfig |   2 +
 drivers/clk/clk_stm32mp1.c          |   9 +
 drivers/rtc/Kconfig                 |   6 +
 drivers/rtc/Makefile                |   1 +
 drivers/rtc/stm32_rtc.c             | 321 ++++++++++++++++++++++++++++++++++++
 6 files changed, 341 insertions(+)
 create mode 100644 drivers/rtc/stm32_rtc.c

-- 
2.15.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

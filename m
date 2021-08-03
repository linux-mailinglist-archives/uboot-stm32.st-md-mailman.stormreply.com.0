Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE463DEA5B
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Aug 2021 12:05:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 420F8C5A4D2;
	Tue,  3 Aug 2021 10:05:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 967A8C5A4CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 10:05:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1739vNPp021844; Tue, 3 Aug 2021 12:05:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=JxMhO7n70vXcYYVlALLZcv1OSAA4fZb55QMl+QwajGk=;
 b=KZlTon1CAQAy97WcGt8CClC0lFAnuOoUwXfqa1/8sVn02EsHcAhxSLkiT4NwKpfUsCHb
 wMSI72VGBB1uSmR6ELfSOZoFOSImVwO3uJ2wXoUw8HEwNngSS7P0momHq7LDl17imqs4
 bm7IGrWn8kmJCaZZKKVSST+GPwKRPkFswbJApKUyHacC3OtbkLdqEvNy8t6vxpAZKh4K
 UoYk8FoDfM35ypSndiQ8KlLamurtizOSQuxOc89rAixItVWowhapL2W/PrDK3RHOTt8j
 JU/XCDSsChNN5pJulo9wLUDkhzlaksor2W/0eZPhjQfFDm8ZVEkq6A6jhQsf1tDPWau1 EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a6tqkjmd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 12:05:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB38310002A;
 Tue,  3 Aug 2021 12:05:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D5FC221BF5A;
 Tue,  3 Aug 2021 12:05:31 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021 12:05:31
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 3 Aug 2021 12:05:08 +0200
Message-ID: <20210803100515.29383-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_02:2021-08-03,
 2021-08-03 signatures=0
Cc: Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v1 0/7] i2c: stm32f7: driver update
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

This series is adding/updating several driver's feature:
  - each I2C instance has its own private data
  - add DT i2c-analog-filter property support
  - implement digital filter setting
  - add DT i2c-digital-filter-width-ns and i2c-digital-filter properties support
  - i2cclk is computed only one time

Patrice Chotard (2):
  arm: dts: stm32: Add i2c-analog-filter property in I2C nodes for
    stm32f746
  arm: dts: stm32: Add i2c-analog-filter property in I2C nodes for
    stm32h743

Patrick Delaunay (5):
  i2c: stm32f7: move driver data of each instance in a privdata
  i2c: stm32f7: support DT binding i2c-analog-filter
  i2c: stm32f7: fix configuration of the digital filter
  i2c: stm32f7: add support for DNF i2c-digital-filter binding
  i2c: stm32f7:  compute i2cclk only one time

 arch/arm/dts/stm32f746.dtsi |  4 ++
 arch/arm/dts/stm32h743.dtsi |  4 ++
 drivers/i2c/stm32f7_i2c.c   | 91 +++++++++++++++++++++----------------
 3 files changed, 59 insertions(+), 40 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

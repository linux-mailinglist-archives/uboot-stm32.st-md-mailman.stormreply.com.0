Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDA02FD158
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Jan 2021 14:42:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E452BC3FADA;
	Wed, 20 Jan 2021 13:42:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57B77C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jan 2021 13:42:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10KDaXHo029627; Wed, 20 Jan 2021 14:42:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=vysT7vE3qW8xF85ob6NLKOVm9ziQ16aL53ubiNTTYtM=;
 b=2QdBysA27Kz2h2Jn5DgGH7ViYjRrvQJI4nzCdnvJ7qzN6uh8+Nau2REWq0/kHaMo4kF0
 gmf/JRk6SZpV26wyTvqDxaZ37HkIEbYYOELwlVGhf/V6pZ3I6z4KXj2KggYi/JR4kb2N
 6mCRm9RvlLtryCnhE1hhcknBDPlKVsNw4eeqYuO3djMuaTXbzVmbghH5/CHQ7GoDr6kM
 M2Ay7MM8QinKmbnbYZlgPzMYUYgzlH1tQH6sK2cwEqJEF84TfBvCjKv2ZvdZ15cQHFVW
 P1GMb9YMKr+03dhafN1zdgGJd6hpE4x4KT7c4l92Ra67dMktLcWHzHpAP7K4bf6QdRTC vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668pyvtgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 14:42:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6DE3910002A;
 Wed, 20 Jan 2021 14:42:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D727250720;
 Wed, 20 Jan 2021 14:42:10 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan 2021 14:42:09
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 Jan 2021 14:42:00 +0100
Message-ID: <20210120134205.30488-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_05:2021-01-20,
 2021-01-20 signatures=0
Cc: Vignesh R <vigneshr@ti.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 0/4] Add WATCHDOG_RESET() in MTD framework and
	STM32 QSPI driver
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


In case of large area read/write/erase on spi nor and spi nand,
watchdog may occurs depending on watchdog timeout and MTD device size.
Some of these use-cases has been reproduced with stm32mp157-ev1 board.

To prevent this situation, WATHDOG_RESET() are added at several
location:
  - Add WATCHDOG_RESET() in spi_nor_erase() and spi_nor_write()
  - Add WATCHDOG_RESET() in _stm32_qspi_read_fifo()
  - Add WATCHDOG_RESET() in nanddev_mtd_erase()
  - Add WATCHDOG_RESET() in spinand_mtd_read() and spinand_mtd_erase()


Patrice Chotard (4):
  mtd: spi-nor: Add WATCHDOG_RESET() in spi_nor_core callbacks
  spi: stm32_qspi: Add WATCHDOG_RESET in _stm32_qspi_read_fifo()
  mtd: nand: Add WATCHDOG_RESET() in nanddev_mtd_erase()
  mtd: spinand: Add WATCHDOG_RESET() in spinand_mtd_read/write()

 drivers/mtd/nand/core.c        | 2 ++
 drivers/mtd/nand/spi/core.c    | 3 +++
 drivers/mtd/spi/spi-nor-core.c | 3 +++
 drivers/spi/stm32_qspi.c       | 2 ++
 4 files changed, 10 insertions(+)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AB12F1742
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Jan 2021 15:03:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04AB2C32EA7;
	Mon, 11 Jan 2021 14:03:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 131F6C32EA7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jan 2021 14:03:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10BE2Tcx014172; Mon, 11 Jan 2021 15:03:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=CW89HtLUJgci9Fpx8c1z7w5tPSJkBnJubSHt8ybONxQ=;
 b=ASsvoHshIUHWaPbqm8FmuRTONHtmljQd6G2Pp2bTiGxLrwlhRhDaFvrYkNGv4FO57UZg
 79EVQQaFVXON6b9k6HIVkwUhmf9+u/A9lolBdouSUCyHKcwCR7jSQDJ5ECjvlD9aQrXM
 xGyDaFILsUz/oYS/ml4q8FN8c8U41fEtb5t+Zi1hN6tk1eRm9V6paMiguBRKsc2XjiCX
 BwhOwThCegGoQ9SGNn/3pXQdsFmL2fgHVWUCbhZyQpQLicpePSRDGO6Gr19Se5aExDoq
 Xc3Fo6MhOFFiYDk8qkWfVE+ce7njyFcbmpmEPQBlp8BBSyvE6RmPziywf6ErPmMYBTjc 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35yp3xf5j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 15:03:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BBBA5100038;
 Mon, 11 Jan 2021 15:03:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9733D2B4D28;
 Mon, 11 Jan 2021 15:03:52 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 Jan 2021 15:03:52
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 11 Jan 2021 15:03:45 +0100
Message-ID: <20210111140347.5754-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-11_26:2021-01-11,
 2021-01-11 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 0/2] Fix pinmux status display with long pin's
	name
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


This series is fixing 2 issue when pin-controller pin's
name are long :
  _ First issue is concerning stmfx pin-controller which pin's name
    is at least 13 char long but only 10 can be displayed.
  _ Second issue is about pinmux command which is using PINNAME_SIZE
    which need to be increased to displayed long pin's name.


Patrice Chotard (2):
  pinctrl: stmfx: Fix MAX_PIN_NAME_LEN
  pinctrl: Set PINNAME_SIZE to 16

 drivers/pinctrl/pinctrl-stmfx.c | 2 +-
 include/dm/pinctrl.h            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 016D8490BBD
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Jan 2022 16:49:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DA1BC57B6C;
	Mon, 17 Jan 2022 15:49:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66E74C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jan 2022 15:49:29 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20HDgQu8006872;
 Mon, 17 Jan 2022 16:49:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=qhjI2proaZ+W/nNI6or1GDxZg8Akv45d015ybKnesRA=;
 b=HSP2dP10hK6ZQXgZfTf9mE3mRFEhXQ5cQuxHM2PPm3MVTvBnwBg9VwkXVgwve+GOw00z
 OHfiIUUSLaX81/kcFcJCkrOubJc81bxm4PhAL3FNHEIDH6Vq80shI/3rJhDGTUUIUp//
 Na5G0vCj0Qyy6PeXdc+lhynZwObtqnJ1KFTR4rW7a81diHxeiz0mrKB0XMmvzDegWxDT
 Hfg1PbY8fMAxrfXhLToncEkAF2vT2kv/MSEP0ORE8JHF+A8kgIO7APY8o5S7KYg9I+9k
 D2+28ciAxt/oziw8SPmhn6Vq8uyLnNEber2Bsfp4oDWpvxec9dWPbpkWsjIiFc0ek34C bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dmxchumaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 16:49:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3645B10002A;
 Mon, 17 Jan 2022 16:49:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F33F21E66D;
 Mon, 17 Jan 2022 16:49:27 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 16:49:26
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 17 Jan 2022 16:49:19 +0100
Message-ID: <20220117154922.1085936-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_07,2022-01-14_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v2 0/3] sandbox: test: activate tests for the
	command LOG
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


This patches activate the command LOG and the associated tests
in sandbox with CONFIG_CMD_LOG=y and solve the associated issues
when these tests are executed.

Patrick

Changes in v2:
- update commit message "sandox" => "sandbox"

Patrick Delaunay (3):
  dm: fix up documentation for uclass_get_by_name_len
  dm: compare full name in uclass_get_by_name
  sandbox: test: activate tests for the command LOG

 configs/sandbox_defconfig |  2 +-
 drivers/core/uclass.c     | 11 ++++++++++-
 include/dm/uclass.h       |  4 ++--
 test/py/tests/test_log.py |  8 ++++----
 4 files changed, 17 insertions(+), 8 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

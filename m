Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 910A514EEA0
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2020 15:40:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50F97C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2020 14:40:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02036C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 14:40:08 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00VENPOC001705
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 31 Jan 2020 15:40:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=YJHE1YkvrzOkKCB5KfIHru5KcMUR+eqx65tlqv4+Qqw=;
 b=hppoJlkeF/vLH/AAUd4nP1VB9qRZ2cYOKq24CzdHrqJDrL5bCXtWqEON1Dbh+z8sytBY
 DMFwM+IUFcozBFmZv2ksoHSunFOjpLFdXBWJzzkE6cmlUW7IPqWREDyEr4VepL1b56rC
 R6ZpIPtX2eL2sQni80sO1H0bZFjdvTYM/OEthzUZZ2ed9JO8rAJ7O7ye9hcTScEyupUw
 4B5n5HxysOUiiPjwVh1Q2b9EYNzCjHq5+u2aVeA9oKrQjLMh0Xzu6nM3LGvKOesrqwuN
 BEIUX/sx+eyFVCEeZIoRqnStYz5KBOz7kr0FuXKVDIA4lcl8rh3ZQCTmbItzA0sKfDUm gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrcayeceq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 31 Jan 2020 15:40:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E9F98100039
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 15:40:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E10D02BF9CB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 15:40:07 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jan 2020 15:40:07 +0100
From: <patrice.chotard@st.com>
To: <patrice.chotard@st.com>, <alexandre.torgue@st.com>,
 <loic.pallardy@st.com>, <benjamin.gaignard@st.com>,
 <gerald.baeza@st.com>, <kamel.kholti@st.com>
Date: Fri, 31 Jan 2020 15:40:01 +0100
Message-ID: <20200131144004.3396-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-31_03:2020-01-31,
 2020-01-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [U-BOOT INTERNAL REVIEW][PATCH 0/3] stm32 and sti
	board: remove dt_high and initrd_high
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

From: Patrice Chotard <patrice.chotard@st.com>

For stm32 f4, f7, h7 and STi boards, remove fdt_high and
initrd_high as they shouldn't be used, this allows the fdt
and initrd relocation.
This implies to set CONFIG_SYS_BOOTMAPSZ to indicate the
amount of memory available to contain kernel, device tree
and initrd for relocation.

Patrice Chotard (3):
  board: stih410-b2260: remove fdt_high and initrd_high
  board: stm32: fix extra env setings addresses
  board: stm32: remove fdt_high and initrd_high

 include/configs/stih410-b2260.h        |  8 ++++++--
 include/configs/stm32f429-evaluation.h | 15 +++++++++------
 include/configs/stm32f469-discovery.h  | 15 +++++++++------
 include/configs/stm32f746-disco.h      | 15 +++++++++------
 include/configs/stm32h743-disco.h      | 14 ++++++++------
 include/configs/stm32h743-eval.h       | 14 ++++++++------
 6 files changed, 49 insertions(+), 32 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

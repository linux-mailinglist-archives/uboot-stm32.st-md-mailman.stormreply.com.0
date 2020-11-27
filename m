Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C68F2C62EE
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 11:21:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18F03C56631;
	Fri, 27 Nov 2020 10:21:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78CFAC56631
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 10:21:13 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARAII8M019318; Fri, 27 Nov 2020 11:21:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=D7q8p4Gx9m2xCOAOOuvXQ7XyaBXkin5M6K60nOlPs1E=;
 b=SFLqi76AkRjEaruy4IRSfAQtUMPOBxnsSqFhTMBDSy1iIjetm/0gaWjnNf311B8X8Nrm
 kJbwXL/+rG2AreDgFtPkXKg5u0akW0P2Y7ocBzWDBKoi3Rch8qufH0T/YiumG7h79IXw
 Q5Jab+pa/b0Mbz+f3QrkR5vng/4UPkbMM3ApSu5bcagamHYX+o3GSBB9jlsgReQkySCz
 C+TCcXn1sj1p4m5gHjynkLnIeCQpVMfQGpt1kjq8PlI2qWY48eTBR/LJGAcMySqtdTIG
 Jd0MCdzoWL4T+asu3dsJTj+qeqdm/wuSkN0INLwRjm6fYv6pL0i37JrnlY8M09xiwmGK nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y01d1xaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 11:21:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A0CBF10002A;
 Fri, 27 Nov 2020 11:21:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9100D236CB6;
 Fri, 27 Nov 2020 11:21:05 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov 2020 11:21:05
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Nov 2020 11:20:50 +0100
Message-ID: <20201127102100.11721-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_05:2020-11-26,
 2020-11-27 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH v2 0/9] log: don't build the trace buffer when
	log is not ready
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


It is the V2 of [1], rebased and with added tests.

To allow test (with console record), I replace the debug uart
function used to display the dropped messages printascii() by
the console generic function puts().

This function allows to support all the features defined in
console.c (as DEBUG_UART, PRE_CONSOLE_BUFFER, CONSOLE_RECORD)
without duplicate them (no more nedd to test CONFIG_DEBUG_UART
for example).

PS: I don't sure that the added trace added for test in
    arch/sandbox/cpu/start.c = "sandbox: starting..."
    is not disturbing.
    see patch 5 = "test: add test for dropped trace before log_init"

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=212739


Changes in v2:
- Add test for LOGL_FORCE_DEBUG (NEW)
- add test to count the dropped messages (NEW)
- replace printascii by console puts, remove test on CONFIG_DEBUG_UART
- Add test of displayed messages requested before log_init (NEW)
- update gd test in console function puts and putc (cosmetic)
- Record all messages in console, even when dropped (NEW)
- added test for content of dropped messages (NEW)

Patrick Delaunay (9):
  test: add LOGL_FORCE_DEBUG flags support in log tests
  log: don't build the trace buffer when log is not ready
  test: log: add test for dropped messages
  log: use console puts to output trace before LOG init
  test: add test for dropped trace before log_init
  console: remove duplicated test on gd value
  console: allow to record console output before ready
  test: log: add test for console output of dropped messages
  log: call vsnprintf only when it is needed to emit trace

 arch/sandbox/cpu/start.c  |  5 +++
 common/console.c          | 32 ++++++++---------
 common/log.c              | 40 +++++++++++++++------
 test/log/log_test.c       | 76 +++++++++++++++++++++++++++++++--------
 test/py/tests/test_log.py | 11 ++++++
 5 files changed, 122 insertions(+), 42 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E02DE218
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Dec 2020 12:42:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9F01C5717D;
	Fri, 18 Dec 2020 11:42:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9942C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Dec 2020 11:42:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BIBb0VP005637; Fri, 18 Dec 2020 12:42:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=yMzsCilTaFnQDsGm1RKbIUQF7T6tFktlkenpqdwr65g=;
 b=h2tTZbCkkONPXbr3bzsfqMT4DUQZm6QsE48hVh3WQYUb2Llo17A2YNRS+oY8dRomzvpf
 jFQH7CsNlgvJ5NhJf6Xgeh+BpPk06eoILEn4qZh8BRSqgj3O5B285nSqvyjM8kwYwv+q
 txW6fpyOcc+vuVUpgr/TItx7QsnDYITeT7/FbTb7YbOA96Q5ByAem5fI4eHXLDC9LWly
 nemILswaG/sYmxAi4RP0WGSKd3HJq3EmnECNMiY8oSwUeXEOvJmeak4e/G717lbpU6oG
 s4cP/GRs3mAqYa5znDWrSe12e9kYe9CfjC2UoLLtTVdOuTD7mbVMt/zqRWQP6TI+If2E qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35cptdngca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 12:42:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C113100034;
 Fri, 18 Dec 2020 12:42:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C4AD23FF10;
 Fri, 18 Dec 2020 12:42:19 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Dec 2020 12:42:18
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 18 Dec 2020 12:42:13 +0100
Message-ID: <20201218114217.9309-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_06:2020-12-18,
 2020-12-18 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH v2 0/4] console: remove #ifdef CONFIG when it
	is possible
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


Hi,

It is the V2 of serie [1] after Simon Glass comments.

Use 'if (IS_ENABLED(CONFIG...))' instead of '#if or #ifdef' where possible

This patchset can applied on master branch after the serie [2]
(for the new order of test in function putc() and puts()
 done in "console: allow to record console output before ready"
)

For information:

I try to remove the sandox code in [3] (with the associated tests
#ifdef CONFIG_SANDBOX) but it wasn't a correct idea.

I will pushed a separate serie to remove the remaining
#ifdef CONFIG_VIDCONSOLE_AS_LCD [4]

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=218309

[2] http://patchwork.ozlabs.org/project/uboot/list/?series=217079
    "log: don't build the trace buffer when log is not ready"

[3] http://patchwork.ozlabs.org/project/uboot/patch/20201127114927.2.Ida70f4fb1524187703e9240d63e436f8ae5adaab@changeid/
    "[2/2] console: sandbox: remove unnecessary sandbox code"

[4] http://patchwork.ozlabs.org/project/uboot/list/?series=218307
    "video: remove VIDCONSOLE_AS_LCD and VIDCONSOLE_AS_NAME"


Changes in v2:
- update also #ifdef CONFIG_SANDBOX after Simon Glass remark
  (code can't be removed to avoid to rely sandbox on debug uart)
- move the tests on gd->flags & GD_FLG_RECORD in helper functions
- remove test on IS_ENABLED(CONFIG_CONSOLE_RECORD)
  before to call helper functions
- add comment for tstcdev variable
- rename console_tstc_check to console_has_tstc

Patrick Delaunay (4):
  console: remove #ifdef CONFIG when it is possible
  console: add function console_devices_set
  console: remove #ifdef CONFIG_CONSOLE_RECORD
  console: add console_tstc_check helper function for CONSOLE_MUX

 common/console.c | 310 ++++++++++++++++++++++++++---------------------
 1 file changed, 175 insertions(+), 135 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

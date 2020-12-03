Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9531B2CD25C
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Dec 2020 10:20:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47EA9C56635;
	Thu,  3 Dec 2020 09:20:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78A93C56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Dec 2020 09:20:38 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B393K8J025898; Thu, 3 Dec 2020 10:20:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=C6PerSOA/ISFLwstJwO+dxcDOJH1f/t/0HDxofSobn4=;
 b=AtcB/ms6hY68EpvCYoyuFmc8z/MfGLrs7v09o1mW817hw9v9tQSNLu7rhBLJteKrq6nP
 2FBSftdetRqVOc0TeoJw28f7kONJfMpWS+yOeqXd0szR1ECJYHR4hhQdR/1egTg94gIR
 H2Wj4OPZNa7JDHk4JV2+l6Z1X9kooP4JHzRnntwOZagEtGqVxxZv6UsATmVFeOVsz1De
 O+UIFBguch6jMKKS1Q7K4hIrjfGFWjhiBmGevf6A00zq2oKRX39jY61M0DJXOgO978kG
 lIWfVzceako3X02GbZPxUqvs5XWxED9WXETJQV0fmKIehrohrwJdUaOTJy8rpJmq1v+7 bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3e7um2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 10:20:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C35FE10002A;
 Thu,  3 Dec 2020 10:20:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B46A823F6D5;
 Thu,  3 Dec 2020 10:20:35 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec 2020 10:20:35
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 3 Dec 2020 10:20:27 +0100
Message-ID: <20201203092032.8124-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_03:2020-12-03,
 2020-12-03 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH 0/4] console: remove #ifdef CONFIG when it is
	possible
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


Use 'if (IS_ENABLED(CONFIG...))' instead of '#if or #ifdef' where possible

This patchset can applied on master branch after the serie [1]
(for the new order of test in function putc() and puts()
 done in "console: allow to record console output before ready"
)

I will push a separate serie to remove the remaining
#ifdef CONFIG_VIDCONSOLE_AS_LCD

And I remove the sandox code in [2] (with the associated tests
#ifdef CONFIG_SANDBOX)

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=217079
    "log: don't build the trace buffer when log is not ready"

[2] http://patchwork.ozlabs.org/project/uboot/patch/20201127114927.2.Ida70f4fb1524187703e9240d63e436f8ae5adaab@changeid/
    "[2/2] console: sandbox: remove unnecessary sandbox code"



Patrick Delaunay (4):
  console: remove #ifdef CONFIG when it is possible
  console: add function console_devices_set
  console: remove #ifdef CONFIG_CONSOLE_RECORD
  console: add console_tstc_check helper function for CONSOLE_MUX

 common/console.c | 291 ++++++++++++++++++++++++++---------------------
 1 file changed, 164 insertions(+), 127 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B6EE16A9
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 11:52:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1D7BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 09:52:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC205C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 09:52:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9N9q0bI024255; Wed, 23 Oct 2019 11:52:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=s9quqUl9JPhQyaLWz7r41bgdJ8Wx4SJ2f0duTfjagGg=;
 b=ZDhw4Fpgh0rHQv6xlgRR2+eBA7SlCNCUbi6Diugw9JKhL35cfx0eUxtfSNJ/n+tnMoUZ
 9L9MMM/G7PPG7OAO61SMHPc1orRJvMZAsMjTssE/l2sCjfzJOGwey/Y1iKLTmqlqrn4a
 mAUwxOKNoZU261AX7vPmYF7Xilsxx1CG6VRHAFtzc/5FeYpr7lHgiF/RkxMD7bxYbOwH
 w+i/NMnh9MfPywKK0NmtHr+uThmj1jk1savvDVxex5bwsz28qEyRDnmspXbH/0iYuvWN
 Ri0qSOY6uKcCXqjLVpm1xrk980doDAv2JmWT9RFZ7VdL3j57EypAW1c1beC9FL3TykJd Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s72v6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 11:52:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 96AF810002A;
 Wed, 23 Oct 2019 11:52:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E3872B4B6C;
 Wed, 23 Oct 2019 11:52:22 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 23 Oct
 2019 11:52:21 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 23 Oct 2019 11:52:21 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/5] configs: stm32f429-evaluation: Disable CONFIG_NET
 flag
Thread-Index: AQHVbS9L+/iDkxxE6E25HGydNV2bjqdoNI1g
Date: Wed, 23 Oct 2019 09:52:21 +0000
Message-ID: <f0c271ecbb3f4b998a23a8c0362dcf28@SFHDAG6NODE3.st.com>
References: <20190917080946.9593-1-patrice.chotard@st.com>
 <20190917080946.9593-3-patrice.chotard@st.com>
In-Reply-To: <20190917080946.9593-3-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_02:2019-10-22,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/5] configs: stm32f429-evaluation:
 Disable CONFIG_NET flag
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

> 
> Network support was never added on this board, disable CONFIG_NET flag to
> avoid following warning:
> 
> ===================== WARNING ====================== This board
> does not use CONFIG_DM_ETH (Driver Model for Ethernet drivers). Please update
> the board to use CONFIG_DM_ETH before the v2020.07 release. Failure to
> update by the deadline may result in board removal.
> See doc/driver-model/migration.rst for more info.
> ====================================================
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---

Applied to u-boot-stm32/master, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

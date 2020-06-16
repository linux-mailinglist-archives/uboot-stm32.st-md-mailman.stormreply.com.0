Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA971FAC28
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 11:18:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E6C9C36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 09:18:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51606C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 09:18:12 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05G9EwK0029464; Tue, 16 Jun 2020 11:18:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pi0c+ZAUlN/ehnzMuo5jy0dx7suqOOIu8P3pskR8w5A=;
 b=QLxUI7xWqxHwdMMrsmgXa0G+gdslLMDY6ECMnX3See6AAQ6qcDZJtIcGJoSvfsOz/Ml7
 b0Ho1Ht5DaGYQ313hw2BEL64i7Z6nf++iWVraDsS+9rIa671QBuswXbz+lMlqsvWf7IL
 6MDPpLtPJeGMIf3Wz/iNSS6R9rbSAUoZVAxyJoZIq6Fmdk7Hn/p+pJOSCiEiaLLThEb0
 0lY5iysA5/ZqUl8efy8Rt2NtlJQ6qpUuHJhIsz1Q7jFTDJ0BkOAeYyoRf/2k5HUzVva/
 TGAiyjAylxJyHrJ8RW9MFTF26bhP2OziVxcbopPH55eizedmNvf6Dg1CzkGlkan1H6hn 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mmjvxc8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 11:18:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 15FAA10002A;
 Tue, 16 Jun 2020 11:18:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 039592B05CE;
 Tue, 16 Jun 2020 11:18:02 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 16 Jun
 2020 11:18:01 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 16 Jun 2020 11:18:01 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] board: stm32mp1: fix handling of DT OP-TEE reserved
 memory nodes
Thread-Index: AQHWOwpeoAE7HE78nkyoxAo3C5JX/ajbB7bg
Date: Tue, 16 Jun 2020 09:18:01 +0000
Message-ID: <ec8213dadc464c90b7c05dde50823a11@SFHDAG6NODE3.st.com>
References: <20200605092427.1.I393865d4202eca31c111da33b792596f130b73d2@changeid>
In-Reply-To: <20200605092427.1.I393865d4202eca31c111da33b792596f130b73d2@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_03:2020-06-15,
 2020-06-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] board: stm32mp1: fix handling of DT
 OP-TEE reserved memory nodes
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

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: vendredi 5 juin 2020 09:24
> 
> From: Etienne Carriere <etienne.carriere@linaro.org>
> 
> Fix the sequence in stm32mp1 fdt.c that disables OP-TEE resources defined in
> FDT when U-boot detects OP-TEE firmware is not present.
> 
> Before this change, helper function stm32_fdt_disable_optee() set property status
> to "disabled" for the OP-TEE reserved memory nodes but this has no impact since
> Linux kernel does not consider the status property for reserved-memory
> subnodes. This change make U-Boot to attempt to delete the node instead.
> 
> Fixes: 4a1b975dac02 ("board: stm32mp1: reserve memory for OP-TEE in device
> tree")
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

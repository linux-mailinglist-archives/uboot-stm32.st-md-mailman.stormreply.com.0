Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A366F38
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:53:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19C54D406D7
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:53:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F7B1D406D6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:53:16 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CCpYVm003238; Fri, 12 Jul 2019 14:53:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GIGqGBxOePAC915OO06NLto169pNDD8tDVHq8rnmNnE=;
 b=hbG1GWFSZ7olI13TjXSGyOIwhHcuRH9YzexK0rO5qEBtENyxAnBMth6b7t3VMqxxRLN7
 OqtR0MnOAMC0A/C+4U8C1KIWcrZ/A4EDjZdErfVzvWaWpiCVGVe1VQAmmNlSsufI7UBz
 KehaCjSFumRN1E5V+4IrZOAtk6hdqnVHMGvbgrnNACOQxY51FK9OmXl3W71xDsPXJrtQ
 R3gD/uVjyYiftoHO4VB35kwsDWmvNMwuEP3qAfHnEt6/gTAeOVAd5FC7YQKVxGgrxh8r
 NQUbQkp3arJg3kRzo4KR7yyRqjwwtfTZXBa3AMaOlnhFrfCotXsq4XcVySl/cnJ+Otfs cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tmh51rdys-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:53:06 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F5FA38;
 Fri, 12 Jul 2019 12:53:05 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5CBB92C4D;
 Fri, 12 Jul 2019 12:53:05 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 12 Jul
 2019 14:53:04 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:53:04 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [U-Boot] [PATCH] MAINTAINERS: Add git custodians for ARM STM
 STM32MP entry
Thread-Index: AQHVJ20rZHcrySkw/kK+5c2d+B+uGqbHEoJA
Date: Fri, 12 Jul 2019 12:53:04 +0000
Message-ID: <6198af8a831e42b2be48a42c205b2f48@SFHDAG6NODE3.st.com>
References: <20190620133528.7584-1-patrice.chotard@st.com>
In-Reply-To: <20190620133528.7584-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Alexander Graf <agraf@suse.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] MAINTAINERS: Add git custodians
	for ARM STM	STM32MP entry
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

> From: U-Boot <u-boot-bounces@lists.denx.de> On Behalf Of Patrice Chotard
> Sent: jeudi 20 juin 2019 15:35
> 
> Add git custodians for STMicroelectronics STM32MP entry.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

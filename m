Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 670F5140D88
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jan 2020 16:13:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3161CC36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jan 2020 15:13:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8702C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 15:13:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HFDFQI032045; Fri, 17 Jan 2020 16:13:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=iVz5jLM42ZNvIA8nJZRWR/AL73VznKVxC7fFhaSmR1Q=;
 b=ce4Lribpk1FyJ+wtgqS+t8z7ny3e/vejwEqh9+KJYrPNyzpZUZUyUw5rQXXpV4rjo6MG
 30fZgf01V3oA5XQFamqQhOSsdrD0WBmb+AX0Ew31setBngUdsRw6s/hDk7Dv/0UPGFyM
 Lpfq5rZYvTRuwhbRyVZQ+lTYnfAw6qbgeOjIwDy1i6fVDSeNy69l84mOz+JLRDm+Cue0
 gDerPJVzu5hb/COOvUU3xAutKrCB3BhFjxYnkGzAUYhq85Z0GiFmLfVpsR7uJHCdMJyb
 r8GA165bdI1Jh3y2IlNdnhaFF3MmDovb9EcE4eoUd8z5Qo0UaXcej2SkIzCbPs/P+2Ye Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xk0r348p5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 16:13:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9C6BC10002A;
 Fri, 17 Jan 2020 16:13:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52D3D2C38B1;
 Fri, 17 Jan 2020 16:13:10 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 17 Jan
 2020 16:13:09 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 17 Jan 2020 16:13:09 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/3] stm32mp1: split board and SOC support for STM32MP15x
 family
Thread-Index: AQHVyhw7BELCpco3E0+URzUWnYjxb6fu/LyA
Date: Fri, 17 Jan 2020 15:13:09 +0000
Message-ID: <b119198f1fc04b8786e49aca0f529b93@SFHDAG6NODE3.st.com>
References: <20200113141742.28182-1-patrick.delaunay@st.com>
 <20200113141742.28182-4-patrick.delaunay@st.com>
In-Reply-To: <20200113141742.28182-4-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_03:2020-01-16,
 2020-01-17 signatures=0
Cc: Michal Simek <michal.simek@xilinx.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Stefan
 Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] stm32mp1: split board and SOC support
 for STM32MP15x family
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
> Sent: lundi 13 janvier 2020 15:18
> 
> Split the board and SOC support for STM32MP15x family and prepare the
> introduction of new boards with STM32MP15x.
> 
> This path define the 2 configurations:
> - STM32MP15x: STM32MP15x soc support (new)
> - TARGET_ST_STM32MP15x: STMicroelectronics board support (choice)
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm32/master, thanks!

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

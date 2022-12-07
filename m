Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E108E645DFA
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Dec 2022 16:51:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94D5BC6411C;
	Wed,  7 Dec 2022 15:51:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24334C01E99
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 15:51:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7DCCkT031174; Wed, 7 Dec 2022 16:51:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=JMYa43iCGW2QVKlwDUanYUcwqgdmU+PJyRalMYLo5wY=;
 b=xLsxzPLp0a6l3VvZcwGb32qdMWr009h1O4tvLPHxLpSrJ6vQV8k0guIuQehQx6/KhRiO
 dIatc2u33PEzRYeGwyNWA/V2QgosIM9+0kYLuwNmhWk6bzT5XtCdCVcZbH2vvMd49eG+
 3sPsMS+jFNGM/n9JvKINwp0T3DcihMEoFrU+AOae4l6GEoZVFoFVz0WWbzRpoH8UIJV2
 oFJ0UOFRwzY6x+Y5JIciXB1/oqbMxSLC2q+TRzcAFnSexnXzGq6YLb11dBZ0VDp6EM4S
 E2lwU4SiDrNgehujxLdCGuY+PZ7KqX7T+cqPZrba84zQ/Y7K0Xm1m3EmixOLfxaB/Ee7 ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7xp78tve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 16:51:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B49B010002A;
 Wed,  7 Dec 2022 16:51:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AD10023BDF6;
 Wed,  7 Dec 2022 16:51:07 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 7 Dec
 2022 16:51:07 +0100
Message-ID: <9a102998-454a-5f08-7f5c-d70646663a7d@foss.st.com>
Date: Wed, 7 Dec 2022 16:51:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>, <u-boot@lists.denx.de>
References: <20221124103605.298002-1-gabriel.fernandez@foss.st.com>
 <20221124103605.298002-2-gabriel.fernandez@foss.st.com>
 <d94cfcae-e92d-1195-9571-9a3d8c7712e9@foss.st.com>
In-Reply-To: <d94cfcae-e92d-1195-9571-9a3d8c7712e9@foss.st.com>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_08,2022-12-07_01,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v4 1/3] dt-bindings: stm32mp13: add clock
 & reset support for STM32MP13
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



On 12/7/22 16:42, Patrice CHOTARD wrote:
> 
> 
> On 11/24/22 11:36, Gabriel Fernandez wrote:
>> Add support of stm32mp13 DT bindings of clock and reset.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>
>> ---
>>
>> Changes in v4:
>> - update MAINTAINERS files
>>
>>  MAINTAINERS                                  |   5 +-
>>  include/dt-bindings/clock/stm32mp13-clks.h   | 229 +++++++++++++++++++
>>  include/dt-bindings/reset/stm32mp13-resets.h | 100 ++++++++
>>  3 files changed, 331 insertions(+), 3 deletions(-)
>>  create mode 100644 include/dt-bindings/clock/stm32mp13-clks.h
>>  create mode 100644 include/dt-bindings/reset/stm32mp13-resets.h
>>
> 
> [...]
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

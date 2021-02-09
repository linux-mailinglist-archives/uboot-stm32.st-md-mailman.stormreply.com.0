Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DFE314BA4
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 10:33:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC938C57B53;
	Tue,  9 Feb 2021 09:33:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72BA6C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 09:33:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1199SLLv026647; Tue, 9 Feb 2021 10:33:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=i3jYrwZ0GAF9+zciO94JHBw0dj5mHncnzMIv5bmTdNg=;
 b=iwlyDMIoy6AZD7npXiEK70J2cfuxhZw+cUAYLXGuIHbvO8OsH0rLS63G0J8dyEdkZbtV
 jOxOUy7ylmimNGERuGrkTYLsrb7CvqxoWRklZeB1lKG4/nAQpr6j7VHhiDGGdBhtRDdq
 X9XRumtbSw+r/OGQFQLhLp1Nzlp+Tn2LntkVWI9N56fnBj50Fpuq37geyZy/Hfr0NADA
 sLNfEeKwlVkrchkk2FhMPBBV1WhtlsycIdQTzSueTCtArC6C4IUEX6s6jcV75yMF3odu
 RjH4MyL3Q0glqAUm0OX/ILWOJry4I671HqHviBQmUE20KWOjZaJXdYgKMVBCwg0jia8N Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrauqngx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 10:33:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D56810002A;
 Tue,  9 Feb 2021 10:33:30 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 146B9221781;
 Tue,  9 Feb 2021 10:33:30 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.118) by GPXDAG2NODE6.st.com
 (10.75.127.70) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 10:33:29 +0100
To: <u-boot@lists.denx.de>
References: <20210121163908.17678-1-patrick.delaunay@foss.st.com>
 <20210121173856.1.Icf7e03823d5975be1d5ec623652c893849882657@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <b015ca9a-afca-ce1a-4198-fc90f2a9d836@foss.st.com>
Date: Tue, 9 Feb 2021 10:33:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210121173856.1.Icf7e03823d5975be1d5ec623652c893849882657@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG1NODE4.st.com (10.75.127.65) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_02:2021-02-09,
 2021-02-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] pinctrl: stm32: correct management
 pin display of OTYPE
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 1/21/21 5:39 PM, Patrick Delaunay wrote:
> OTYPE can be used for output or for alternate function to select
> PP = push-pull or OP = open-drain mode, according reference manual
> (Table 81. Port bit configuration table).
>
> This patch removes this indication for input pins and adds it
> for AF and output pins for pinmux command output.
>
> Fixes: b305dbc08b08 ("pinctrl: stm32: display bias information for all pins")
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   drivers/pinctrl/pinctrl_stm32.c | 18 ++++++++----------
>   1 file changed, 8 insertions(+), 10 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FCA65C4C3
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 18:08:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84DDEC65048;
	Tue,  3 Jan 2023 17:08:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98CECC03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 17:08:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303FbHwe021161; Tue, 3 Jan 2023 18:08:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3uMoEZCA31EuCAnoBfUIYCJX7A5qNzkZCzGckb1OBqM=;
 b=dEWFP4iV/63pKfFwWPC+NtIPywRzTzoSuBWZKZPepBPltvvh7Qu60T2V2BnN+H7gi5qq
 YaGdlkUBz8ezeJiVU+OjtWVmSH6vrZxOMClatcEpkSXMXsPAi8M+cqsK9dMIS1v63IUp
 v1gxkzDUVpSi4GCgAgurKEB0024jxBtUMpB/NY1g5vsN0o8EsUXcHpFKATEoDKWOoJXx
 pjjgCxiY3EQWPIlFpiFWrr4DQEcO1Cwj/ZrNbRr9bAvz0y2SWnORPKJ0VeWAnPxqX9+z
 AO47XDrF7kjfghhFeeXDY7VWlF0yMnQn0sg8LbaJXmrB79EPpv7xE0QsU2Ol0AHFtN9g xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtb3e6ahm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 18:08:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AFFA210002A;
 Tue,  3 Jan 2023 18:08:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA32A22F7BB;
 Tue,  3 Jan 2023 18:08:10 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 18:08:07 +0100
Message-ID: <89b9b76f-e881-1256-59f8-af2f9fabb98c@foss.st.com>
Date: Tue, 3 Jan 2023 18:08:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>, <u-boot@lists.denx.de>
References: <20221215125058.1.I12616a161ad14b61957ff2da5357c1220bc0d77b@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20221215125058.1.I12616a161ad14b61957ff2da5357c1220bc0d77b@changeid>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_05,2023-01-03_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] adc: stm32mp15: add calibration support
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

On 12/15/22 13:51, Olivier Moysan wrote:
> Add support of offset and linear calibration for STM32MP15.
> The calibration is performed once at probe. The ADC is set in power on
> state for calibration. It remains in this state after calibration,
> to give to the kernel the opportunity to retrieve calibration data,
> directly from the ADC.
>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>
>   drivers/adc/stm32-adc.c | 134 ++++++++++++++++++++++++++++++++++------
>   1 file changed, 116 insertions(+), 18 deletions(-)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

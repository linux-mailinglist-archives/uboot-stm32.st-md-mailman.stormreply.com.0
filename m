Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E24A54F40C
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jun 2022 11:15:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5021C5F1F2;
	Fri, 17 Jun 2022 09:15:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58C64C5F1EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 09:15:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H6RGQV029141;
 Fri, 17 Jun 2022 11:15:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PBhfmSHpsYOUp3tQ7i3Fh5j33iL8Z2UM07FdJm+kwBs=;
 b=syvNpLcvku3tl6Uoyer2N/dN4SVCcSllPG50npH7kKy13hkVbJmGJaIHk7ecFHVPhhSs
 vWXYxOQtvb1ZIGnsraFgxjRcgWuraSGYrmOnJiZ+skHygJb624Htk8oYuBQEYYYpnpPQ
 NU57zpI4yiChdagwkefNZYL9wM2Icbfr32EaDznFCFhwZ0jbKsFyg9M/AOj2H+oBwkGa
 Z6/cXjdzLgxbu9Gz7ZsXINHhBMqZ+T+PB8FTpPvEYfMc2lU8B/Q3TUgGKwngvTW0HWVG
 wqh2FMU6S/HQNWMsOQcjeMJr5GYideL+lkp952et0544UvJPttCOCZ3qLTTq+7xQ8JgL Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3grmbw10pg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 11:15:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08156100034;
 Fri, 17 Jun 2022 11:15:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0256521A234;
 Fri, 17 Jun 2022 11:15:42 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.118) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 17 Jun
 2022 11:15:41 +0200
Message-ID: <f3435ea6-a164-e535-7977-ac74ff0a755c@foss.st.com>
Date: Fri, 17 Jun 2022 11:15:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220606160414.v1.1.I4f6455f026820524103f7fbdffaafd3b75585197@changeid>
 <20220606160414.v1.2.Ida901b98d25a7f60b6fb05d18f2e030d9c9ecc5c@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220606160414.v1.2.Ida901b98d25a7f60b6fb05d18f2e030d9c9ecc5c@changeid>
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_08,2022-06-16_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] ARM: stm32: activate OF_LIVE for
	DHSOM
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

On 6/6/22 16:04, Patrick Delaunay wrote:
> Activate the live DT with CONFIG_OF_LIVE to reduce the DT parsing
> time.
>
> Tested-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v1:
> - previously sent as RFC, Tested by Marek
>    http://patchwork.ozlabs.org/project/uboot/list/?series=301157
>
>   configs/stm32mp15_dhcom_basic_defconfig | 1 +
>   configs/stm32mp15_dhcor_basic_defconfig | 1 +
>   2 files changed, 2 insertions(+)


Applied to u-boot-stm/next, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

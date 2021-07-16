Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA4E3CB42A
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jul 2021 10:27:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBC93C59781;
	Fri, 16 Jul 2021 08:27:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0996C57B6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jul 2021 08:27:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16G8CDjF027719; Fri, 16 Jul 2021 10:27:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=TCsxr83WTdMAFOKBejfiXrBl1VrHony4Aylg9f4BsPg=;
 b=o6CudP85SC6UkhCaMngornfqZrY6ZoDeQ9PVKJ4CullI62TDtRCLg/z07e6RhDBtRb9J
 m7vyHSzi55o+2Q/8pp9zSQqK+rZNgYPEsm1JMvjusUyp6gOe1tP0msLqHW3s79BSwccb
 E3KMXxOzlEDd4AIjUWxpm6QwCpHAqkKXmqCHx7jk5Uk04BYO3gy7qfPdVoCrXNyVK2OG
 ympGKkqTO/Y+QlBra95vzI+3v/5UbUR3gP305FKN9UZvHmQtdg/CSACgMbGOuHeyVuGF
 LnPwwx+JiVfUuE9jSqSpq9ljFxHCGlYjjScm4Xvxc6O3fc++SqgvToGIy49htp25i7nT DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tw1kaunr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:27:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA83710002A;
 Fri, 16 Jul 2021 10:27:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B10B5218C9E;
 Fri, 16 Jul 2021 10:27:44 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul
 2021 10:27:44 +0200
To: <u-boot@lists.denx.de>
References: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
 <20210628145519.1.I222bda2f6a603fbc60ccaae84a9936af8ccbba8b@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <363ead8f-2436-88f9-ab2b-82925edf580b@foss.st.com>
Date: Fri, 16 Jul 2021 10:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628145519.1.I222bda2f6a603fbc60ccaae84a9936af8ccbba8b@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_02:2021-07-16,
 2021-07-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/7] stm32mp: configs: activate the
 command stm32key only for ST boards
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

On 6/28/21 2:55 PM, Patrick Delaunay wrote:
> This command is used to evaluate the secure boot on stm32mp SOC,
> it is deactivated by default in real products.
>
> We activate this command only in STMicroelectronics defconfig
> used with the evaluation boards.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/Kconfig       | 4 +++-
>   configs/stm32mp15_basic_defconfig   | 1 +
>   configs/stm32mp15_trusted_defconfig | 1 +
>   3 files changed, 5 insertions(+), 1 deletion(-)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

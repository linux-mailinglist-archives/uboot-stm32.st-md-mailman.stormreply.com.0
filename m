Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A2C2F4833
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jan 2021 11:06:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 804B3C32EA8;
	Wed, 13 Jan 2021 10:06:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E39FC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 10:05:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10DA1uli006427; Wed, 13 Jan 2021 11:05:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Mg/+EParEPlkUcyv+x+UIVeDMYUPHLJsSj/kokiN4R8=;
 b=caImwkc2DNxqep8KHGr2mhR1mlWDJf+8tRID1kDovANSnKDbGi2foBSt4uyc7v69H0Qr
 dJDWP0I8Idx3bb8onhPolzpIJXKDKEPFOdoE0iDbnPDiamDBLhwmSxBXQx+AIaW79faq
 CLFL4pLRjIsFhYjEWAXU8lDSlicCVq0xNHBBSOBbAfr8fF15rm/RteFvljWmKLjxqEIL
 S2k/Cs9VD36FNBLj/KOOi933YoXeQyJTiE8wxrxukw9CIaV0yARhJ+CA6E+g9etliGF2
 1jDZbQhUU6j+sz9XZA7UTbNzp6oYfZuB9kOG0jkzNlNBRcpAPTWw2RsbSvubHveAxs9h 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5gx5rn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 11:05:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0960310002A;
 Wed, 13 Jan 2021 11:05:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9656230835;
 Wed, 13 Jan 2021 11:05:57 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Jan
 2021 11:05:54 +0100
To: U-Boot Mailing List <u-boot@lists.denx.de>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
 <20201106180201.31784-34-patrick.delaunay@st.com>
 <f87e7ca165d94d24b35546e67d4d4273@SFHDAG2NODE3.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <4cb3f288-dd38-40b9-b87b-adfa4e6111c8@foss.st.com>
Date: Wed, 13 Jan 2021 11:05:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f87e7ca165d94d24b35546e67d4d4273@SFHDAG2NODE3.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_05:2021-01-13,
 2021-01-13 signatures=0
Subject: Re: [Uboot-stm32] FW: [PATCH v2 33/33] configs: stm32mp15: enable
	LOG features
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


> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: vendredi 6 novembre 2020 19:02
> Activate the logging features in SPL and U-Boot (CONFIG_LOG and CONFIG_SPL_LOG) and the command 'log' with CONFIG_CMD_LOG.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
> (no changes since v1)
>
>   configs/stm32mp15_basic_defconfig   | 2 ++
>   configs/stm32mp15_trusted_defconfig | 1 +
>   2 files changed, 3 insertions(+)
>

For the Serie:

Applied to u-boot-stm/master, thanks!

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

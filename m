Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01495326444
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Feb 2021 15:42:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD1A6C57189;
	Fri, 26 Feb 2021 14:42:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88D47C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 14:42:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QEXEHO032420; Fri, 26 Feb 2021 15:42:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=hA9O3bSjudfMfvDPGpkGnx4g42r8BHM5YdnCsAe9k14=;
 b=ZrreY7EbuPoiWPF9rfskl4wotzx2BoyURT7rxcTWHdlsaP10OJmBitYcm1Ld2Y/fpnn0
 Cif3Z1C6JScU1IZVfWheW8Vd6JlBheId8sIzh7r7QVvrCZIbPDpJpR4bHSVFFctEavVH
 2sUfPNI//aaVmT1/fI9nqCbrpBMY+QUWlxEQt5bEfc1DUUvE7myKO7HoxqNwgmJ7SqUf
 xmEmBKVwYQ22FtMBWuSohDtjdSkL/9IP5SG1Nrv4MQqeTPhsVDZUwh9F72wSClQB0Ejh
 VdoYUgxxZtWnfBK2PZzQkEeUfTeTHyyOyYh9YE4/CMhxcQm2/JPzybUaPypZE1oEViv9 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66ue6m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 15:42:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3D7A7100034;
 Fri, 26 Feb 2021 15:42:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2DD4423FEBF;
 Fri, 26 Feb 2021 15:42:54 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 15:42:49 +0100
To: <u-boot@lists.denx.de>
References: <20210224110052.1.Ic9a63839b6826cc50ac66c2e87b1abf12bc5adfd@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <561f5e2e-45d6-cd1b-1687-21432138873f@foss.st.com>
Date: Fri, 26 Feb 2021 15:42:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224110052.1.Ic9a63839b6826cc50ac66c2e87b1abf12bc5adfd@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_03:2021-02-24,
 2021-02-26 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: remove duplicate
	uart nodes
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

On 2/24/21 11:00 AM, Patrick Delaunay wrote:
> Remove duplicated uart nodes introduced with commit 62f95af92a3f
> ("ARM: dts: stm32mp1: DT alignment with Linux kernel v5.9-rc4"),
> because the uart nodes wasn't correctly ordered in alphabetic order.
>
> Only cosmetic: the generated device tree don't change.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp15-pinctrl.dtsi | 80 -----------------------------
>   1 file changed, 80 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

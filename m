Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F36B5B34A4
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Sep 2022 11:57:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2E1EC64112;
	Fri,  9 Sep 2022 09:57:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17830C64111
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Sep 2022 09:57:21 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289690nZ014375;
 Fri, 9 Sep 2022 11:57:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ijOkEMKPF9og++hxuwu8O5ibyLwKN8IZJs4Gv5KyP2o=;
 b=xjLGORpPfqT7guSVzNJJNrxJuZJKHx500Y6MMCKZfIe5jfRUm/Jt8sssFcQtm1qtwypQ
 TMWMSzMRGcEk3g9tVTtNirLtSPSyPLc59E+IH6YqQleluqXX+2QFI6vovItRw5QzMrCv
 fd3Pfd15dJyyzcR3mR/zB2IaEeEqJwcmDzlpTQqAfrGshB2M2Rkq+ilOdTyHqQTWtC7y
 6fXl2lR1RpLQ1lB/m0IXCmTP+uFv9ZuvtKIzW3KJNIOyHzgpB8T/iYV3Orqa7KYoQrmx
 UrGRRKgKeQuc58pClqU9Ot3IJNGP0+af71+vcD0qeH67tnj8UN7LE18rMszN4jD7kPR3 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jbvbnvnkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Sep 2022 11:57:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3691010002A;
 Fri,  9 Sep 2022 11:57:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3080521FEAB;
 Fri,  9 Sep 2022 11:57:14 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Fri, 9 Sep 2022
 11:57:13 +0200
Message-ID: <720e22cc-2cc2-b552-0f73-f19b45f913ef@foss.st.com>
Date: Fri, 9 Sep 2022 11:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220907181837.1.I0747e53f8be04bfad23047f27b2485dd916eab75@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220907181837.1.I0747e53f8be04bfad23047f27b2485dd916eab75@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_04,2022-09-09_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] confis: stm32mp15: activate
	DM_REGULATOR_SCMI
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

Hi Patrick

Don't forget to fix the confis/configs when applying this patch ;-)

On 9/7/22 18:18, Patrick Delaunay wrote:
> Activate the support of SCMI regulator to support the scmi_reg11,
> scmi_reg18 and scmi_usb33 regulators present in the scmi device tree of
> STMicroelectronics boards with stm32mp15-scmi.dtsi
> 
> Fixes: 6cccc8d396bf ("ARM: dts: stm32: add SCMI version of STM32 boards (DK1/DK2/ED1/EV1)")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp15_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index fd2a5de8d13..0f6b3738cad 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -120,6 +120,7 @@ CONFIG_DM_REGULATOR_FIXED=y
>  CONFIG_DM_REGULATOR_GPIO=y
>  CONFIG_DM_REGULATOR_STM32_VREFBUF=y
>  CONFIG_DM_REGULATOR_STPMIC1=y
> +CONFIG_DM_REGULATOR_SCMI=y
>  CONFIG_REMOTEPROC_STM32_COPRO=y
>  CONFIG_RESET_SCMI=y
>  CONFIG_DM_RNG=y

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

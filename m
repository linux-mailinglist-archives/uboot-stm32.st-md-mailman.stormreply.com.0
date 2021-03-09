Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 801C53325E8
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Mar 2021 13:58:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30271C57183;
	Tue,  9 Mar 2021 12:58:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8FEBC56631
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 12:58:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129CurDO001075; Tue, 9 Mar 2021 13:57:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2kx033loI+Nt9OJp2rokxDqSnoCxcA8OBY45UmMoKSY=;
 b=G5U9e14fd7b1qErwPxP/2/BWz2DzVrRAsPdOVJKhJzCFMbMF4P/PrSm322+MhP6UDd3y
 vTXtIAC2+Vyq1G4fNsF4KFEMvKTExoHzMpuScRrAtFLAq5J7qgJ/fBaM8l3rrGZX8U5B
 xsTEO4JdVSnmWDrFgjjBBDsV/BZpsEnZ4zrWL4dTvkNieWP+kcy/ZuxTjHeo4PCQ4kyV
 8BxcEcn9HOL6o7O9/eleu8JbNIZWICFnxmfsGhLVnDGimoUYrmdoZrZGahBnBqA6LIsS
 jQrmu19qmeImr0FHreGLZCMZx6l1zcoVHl9UA5Yt/DeOE1yNUcz4SmvtaTPFjzRdB9Y9 cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741gphtm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 13:57:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 274C110002A;
 Tue,  9 Mar 2021 13:57:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 027052547E4;
 Tue,  9 Mar 2021 13:57:54 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Mar
 2021 13:57:52 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
 <20210224111907.1.I9565e66593bf785bf3616f10c76b168a87acaf77@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <6d30b972-3199-ae27-f72f-2e58502a9f6d@foss.st.com>
Date: Tue, 9 Mar 2021 13:57:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224111907.1.I9565e66593bf785bf3616f10c76b168a87acaf77@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, Etienne Carriere <etienne.carriere@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] ARM: dts: stm32mp1: explicit clock
 reference needed by RCC clock driver
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

On 2/24/21 11:19 AM, Patrick Delaunay wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Define in the RCC clock provider node which root clocks the driver
> depends on. These are root oscillators, which may be present or
> not, upon FDT content.
> 
> This update binding is introduced in Linux kernel device tree by patch
> "ARM: dts: stm32: move clocks/resets to SCMI resources for stm32mp15"
> 
> This patch is a preliminary step for SCMI support of stm32mp15
> boards with trusted boot chain, based on TF-A or OP-TEE.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Reference:
> 
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210126090120.19900-13-gabriel.fernandez@foss.st.com/
> 
> 
>  arch/arm/dts/stm32mp151.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
> index eedea6f4b8..b564fc6269 100644
> --- a/arch/arm/dts/stm32mp151.dtsi
> +++ b/arch/arm/dts/stm32mp151.dtsi
> @@ -1136,6 +1136,10 @@
>  			reg = <0x50000000 0x1000>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> +
> +			clock-names = "hse", "hsi", "csi", "lse", "lsi";
> +			clocks = <&clk_hse>, <&clk_hsi>, <&clk_csi>,
> +				 <&clk_lse>, <&clk_lsi>;
>  		};
>  
>  		pwr_regulators: pwr@50001000 {
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

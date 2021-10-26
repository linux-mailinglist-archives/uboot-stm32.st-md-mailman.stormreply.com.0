Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A381543AC99
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Oct 2021 09:05:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 423D3C5719C;
	Tue, 26 Oct 2021 07:05:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF5B1C0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 07:05:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PLMhgE029413; 
 Tue, 26 Oct 2021 09:05:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Q9lIT+j0lEC3sMtHqdXxBfm9HzWjzq0kw+445Ddw9Y8=;
 b=Wpv5XXY8Mp0pWNFVzFDIUF0DidbtdY45XzCCLdoYOyBJ/ImfXyUiTUx3ii1vJeCNnOJJ
 oU9lCbPr1MDY0T4Tyj8+e1oJ4XKK/4AdxCFoey67pePzERDBBZ3LUzge3zXwFcL6pHCK
 1mN3ERgs8yzMarzDcuhY0Tz9z3V6WtqjMyxyRoNQNWt9nJubZY2DKsN8qtcTaoXmZARB
 zgGFxZ9xueXjG0VgF7jBHJVTJmt4XGRrJ4qi0K/a0gIfD6NAnElQvHbB1vIK1jwvJkO2
 NLBe9EnUxbGXZ+euh8JXDfyrEJfFiEESB6obwW8p4T27iZl/QnPW38doQu+NwHc0ws+N uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bx4er2gjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 09:05:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CD2FB10002A;
 Tue, 26 Oct 2021 09:05:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDD1C212308;
 Tue, 26 Oct 2021 09:05:35 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 26 Oct
 2021 09:05:35 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211021115403.1.I74f77fe0ac99dd20cbf08dee326bc81e814b86c6@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <ffc9c68a-7aed-7d90-eb81-0ed58788bed6@foss.st.com>
Date: Tue, 26 Oct 2021 09:05:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021115403.1.I74f77fe0ac99dd20cbf08dee326bc81e814b86c6@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_08,2021-10-25_02,2020-04-07_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: alignment with
	v5.15-rc6
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

On 10/21/21 11:54 AM, Patrick Delaunay wrote:
> Device tree alignment with Linux kernel v5.15-rc6
> - Set {bitclock,frame}-master phandles on ST DKx
> - Add coprocessor detach mbox on stm32mp15x-dkx boards
> - Add coprocessor detach mbox on stm32mp157c-ed1 board
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp157c-ed1.dts  |  4 ++--
>  arch/arm/dts/stm32mp15xx-dkx.dtsi | 12 ++++++------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
> index 6e89f88a17..f62b46b8dd 100644
> --- a/arch/arm/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/dts/stm32mp157c-ed1.dts
> @@ -321,8 +321,8 @@
>  &m4_rproc {
>  	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
>  			<&vdev0vring1>, <&vdev0buffer>;
> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
> -	mbox-names = "vq0", "vq1", "shutdown";
> +	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> +	mbox-names = "vq0", "vq1", "shutdown", "detach";
>  	interrupt-parent = <&exti>;
>  	interrupts = <68 1>;
>  	status = "okay";
> diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
> index 68987f64c5..8fc93b0f94 100644
> --- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
> @@ -228,15 +228,15 @@
>  			cs42l51_tx_endpoint: endpoint@0 {
>  				reg = <0>;
>  				remote-endpoint = <&sai2a_endpoint>;
> -				frame-master;
> -				bitclock-master;
> +				frame-master = <&cs42l51_tx_endpoint>;
> +				bitclock-master = <&cs42l51_tx_endpoint>;
>  			};
>  
>  			cs42l51_rx_endpoint: endpoint@1 {
>  				reg = <1>;
>  				remote-endpoint = <&sai2b_endpoint>;
> -				frame-master;
> -				bitclock-master;
> +				frame-master = <&cs42l51_rx_endpoint>;
> +				bitclock-master = <&cs42l51_rx_endpoint>;
>  			};
>  		};
>  	};
> @@ -478,8 +478,8 @@
>  &m4_rproc {
>  	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
>  			<&vdev0vring1>, <&vdev0buffer>;
> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
> -	mbox-names = "vq0", "vq1", "shutdown";
> +	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> +	mbox-names = "vq0", "vq1", "shutdown", "detach";
>  	interrupt-parent = <&exti>;
>  	interrupts = <68 1>;
>  	status = "okay";
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

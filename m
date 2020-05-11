Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 984591CDBE0
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 15:53:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64301C36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 13:53:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BB46C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 13:53:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDS0SZ024954; Mon, 11 May 2020 15:53:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Qb/5AR3DwfL2MaVyesQ8bYMBNXP6MJfUGb/be4eyZps=;
 b=GzD1BMQ7mpdY0i6KADcwgFyIe8bTBEMnKPuCfQxbKLDltgelbnTrTWxqrVxm5aQDnJpV
 u8fj6x3ZzGugrREHB3MC4wmzk6aZXqFo3p72Ii2hXfTat5AgbJzold34DA8yOHk6SPJr
 7aYONT829XqhN4sxu1OZC6zjkrJkdJoKnxaWfrbYOBsoR6tRpc+ASI7F+5lIMAJxTnh7
 syyZtj8YfRFwPglTGQR+pq5W4e92+/PCki4ZPSALjf6W3SscVAWmWZxZIfEjbt4id2hO
 JRt2ixxqh5X5o4KCZAInJNKhB/9d5aqTA/sw5ebGXcxvEEAgDSpiBm2f45PqUMdabrqJ 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30whn9ascc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 15:53:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1EFAB10002A;
 Mon, 11 May 2020 15:53:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F5EB2A9761;
 Mon, 11 May 2020 15:53:18 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 11 May
 2020 15:53:17 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 11 May 2020 15:53:17 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 6/9] arm: stm32mp: add weak function to save vddcore
Thread-Index: AQHWF+8v/57SWcISHEaAtzyK93DGXaii5aWA
Date: Mon, 11 May 2020 13:53:17 +0000
Message-ID: <e5d73716-f0cf-8226-5028-39e286f84b61@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
 <20200421171123.6.I845d08dcbe270a6b9339cdca96d25b1f4ce0e13e@changeid>
In-Reply-To: <20200421171123.6.I845d08dcbe270a6b9339cdca96d25b1f4ce0e13e@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <2B54A8A1FF1FF34AA20C8A5BE7E4C1FF@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 6/9] arm: stm32mp: add weak function to
	save vddcore
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

On 4/21/20 5:11 PM, Patrick Delaunay wrote:
> Add a weak functions to save the vddcore voltage value provided
> in the OPP node when the clock tree is initialized.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/include/mach/sys_proto.h | 3 +++
>  drivers/clk/clk_stm32mp1.c                     | 5 +++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index 1617126bea..55193b5c2d 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -43,3 +43,6 @@ void get_soc_name(char name[SOC_NAME_SIZE]);
>  u32 get_bootmode(void);
>  
>  int setup_mac_address(void);
> +
> +/* board power management : configure vddcore according OPP */
> +void board_vddcore_init(u32 voltage_mv);
> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
> index baacc1abb5..5fccc03ba7 100644
> --- a/drivers/clk/clk_stm32mp1.c
> +++ b/drivers/clk/clk_stm32mp1.c
> @@ -1225,6 +1225,10 @@ bool stm32mp1_supports_opp(u32 opp_id, u32 cpu_type)
>  	}
>  }
>  
> +__weak void board_vddcore_init(u32 voltage_mv)
> +{
> +}
> +
>  /*
>   * gets OPP parameters (frequency in KHz and voltage in mV) from
>   * an OPP table subnode. Platform HW support capabilities are also checked.
> @@ -1302,6 +1306,7 @@ int stm32mp1_get_max_opp_freq(struct stm32mp1_clk_priv *priv, u64 *freq_hz)
>  		return -FDT_ERR_NOTFOUND;
>  
>  	*freq_hz = (u64)1000U * freq;
> +	board_vddcore_init(voltage);
>  
>  	return 0;
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

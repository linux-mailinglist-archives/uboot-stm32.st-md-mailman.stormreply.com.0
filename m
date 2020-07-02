Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A77BF211C83
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:16:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EA64C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:16:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32B13C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:16:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627FHni004494; Thu, 2 Jul 2020 09:16:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=g4+N2CYKHRZiX4BkjBBbDcjjP88wltJX3/bZIL5xYU0=;
 b=Iot0ryBSDYPwscg5Qg8Hapc/JHopfz/jSUD9L5kvfsaybUCvqfDJr1AlRxbaV5gcIevy
 Lra35ktVsU8SsJdH4aR2JHeellDZ+AzDs5mOHWS5//djcn/SbAYrf5r9yZx3MgyloWlo
 Fq+qAX7SaFef4Las/LRAq5OVNj81Bk8xaw1ZcWfELNvbgQGrAZJnnq3N9euRe3G6E7nh
 VwBEmW9g7k2Q62o7efZtZ7+dIuoiWaB54LI9U/nw+grVE6xtZg0VQZMfsCTV0S0E9/Ga
 rP9QwmSDUKvvm8+I3017sRktHq9lmjkHTJf9gXXL+PR4e7Ps1EJYIApoPOKZASZQo91F qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wu89xurm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:16:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3D4F2100034;
 Thu,  2 Jul 2020 09:16:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3237420E017;
 Thu,  2 Jul 2020 09:16:50 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 09:16:49 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:16:49 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] arm: stm32mp: stm32prog: add "Device Name" in iproduct
 during DFU USB enumeration
Thread-Index: AQHWQ/q3thb3TYOpeUSGyzwShqAcy6jz2ASA
Date: Thu, 2 Jul 2020 07:16:49 +0000
Message-ID: <4af08ff2-e98d-3ef4-6651-3cdb7ebb6c32@st.com>
References: <20200616182508.1.I15e9f84cc4116350cbec881d243a86f28b819123@changeid>
In-Reply-To: <20200616182508.1.I15e9f84cc4116350cbec881d243a86f28b819123@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <4D6A2F3975DF6342B76D7099220AF325@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp: stm32prog: add "Device
 Name" in iproduct during DFU USB enumeration
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

On 6/16/20 6:25 PM, Patrick Delaunay wrote:
> Add "Device Name" in iproduct during DFU USB enumeration
> to have this information in STM32CubeProgrammer trace
> (this tools is compatible with @Name since v2.3)
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> index 969245e199..30547f94c9 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> @@ -197,10 +197,12 @@ bool stm32prog_usb_loop(struct stm32prog_data *data, int dev)
>  	bool result;
>  	/* USB download gadget for STM32 Programmer */
>  	char product[128];
> +	char name[SOC_NAME_SIZE];
>  
> +	get_soc_name(name);
>  	snprintf(product, sizeof(product),
> -		 "USB download gadget@Device ID /0x%03X, @Revision ID /0x%04X",
> -		 get_cpu_dev(), get_cpu_rev());
> +		 "USB download gadget@Device ID /0x%03X, @Revision ID /0x%04X, @Name /%s,",
> +		 get_cpu_dev(), get_cpu_rev(), name);
>  	g_dnl_set_product(product);
>  
>  	if (stm32prog_data->phase == PHASE_FLASHLAYOUT) {

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

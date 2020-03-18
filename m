Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA41D1898F8
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 11:10:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79FC1C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:10:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BDF4C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 10:10:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IA8ajB030109; Wed, 18 Mar 2020 11:10:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=T5vfUDoy7wXMzuSuYm9mC7j20K9trKvLeB3Yr+k4pYg=;
 b=kJVK5ApDAywETYCZrvYRSc5t0uzqdnSm1iRr6pajohM5d8ti1wNNIsipO2/g9L/1yzXm
 4FFuDVA8i8epMw0gPQ/A4Qwuv5ucqwb0fhFeRsm5liWUHasfJH1Mf9+g7LZvJmh/PAoV
 L7enpuIGwu/70yAsMGOKnW2dmTmEUEdJk4xuGdR20j1vW8RxFt5jHV9WZ5/ydj8T/fnz
 0UiG31f2OAYAuuFQInJiuFzv9INWvNof76Kc+QsVMz/aAhFtokhLVvHRzCb7VIatvMgS
 ZXsOjWhbbl0LZbxReBpBo0wUXpzktBqQKeaik+1jgRQDl+2n6P9hRZgNARhNzF7RjX2c NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95ujqph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 11:10:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BBDD410002A;
 Wed, 18 Mar 2020 11:10:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B06DF220FF5;
 Wed, 18 Mar 2020 11:10:36 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 11:10:36 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 11:10:36 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 05/10] board: stm32mp1: stboard: lock the
 OTP after programming
Thread-Index: AQHV/Q13pwQnGuqc0kGYGWdik4tVIA==
Date: Wed, 18 Mar 2020 10:10:36 +0000
Message-ID: <f96d902a-8c33-c2f3-0c46-91bc1b3e73a3@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-6-patrick.delaunay@st.com>
In-Reply-To: <20200212183744.5309-6-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <1D2961B258B9F043BD747B93F2F70937@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 05/10] board: stm32mp1: stboard: lock the
 OTP after programming
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


On 2/12/20 7:37 PM, Patrick Delaunay wrote:
> Lock the OTP used for board identification for the ST boards after
> programming.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/common/cmd_stboard.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
> index c7ca773b1c..1573e35410 100644
> --- a/board/st/common/cmd_stboard.c
> +++ b/board/st/common/cmd_stboard.c
> @@ -42,7 +42,7 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
>  		      char * const argv[])
>  {
>  	int ret;
> -	u32 otp;
> +	u32 otp, lock;
>  	u8 revision;
>  	unsigned long board, variant, bom;
>  	struct udevice *dev;
> @@ -66,11 +66,20 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
>  		return CMD_RET_FAILURE;
>  	}
>  
> +	ret = misc_read(dev, STM32_BSEC_LOCK(BSEC_OTP_BOARD),
> +			&lock, sizeof(lock));
> +	if (ret < 0) {
> +		puts("LOCK read error");
> +		return CMD_RET_FAILURE;
> +	}
> +
>  	if (argc == 0) {
>  		if (!otp)
>  			puts("Board : OTP board FREE\n");
>  		else
>  			display_stboard(otp);
> +		printf("      OTP %d %s locked !\n", BSEC_OTP_BOARD,
> +		       lock == 1 ? "" : "NOT");
>  		return CMD_RET_SUCCESS;
>  	}
>  
> @@ -129,6 +138,16 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
>  		puts("BOARD programming error\n");
>  		return CMD_RET_FAILURE;
>  	}
> +
> +	/* write persistent lock */
> +	otp = 1;
> +	ret = misc_write(dev, STM32_BSEC_LOCK(BSEC_OTP_BOARD),
> +			 &otp, sizeof(otp));
> +	if (ret < 0) {
> +		puts("BOARD lock error\n");
> +		return CMD_RET_FAILURE;
> +	}
> +
>  	puts("BOARD programming done\n");
>  
>  	return CMD_RET_SUCCESS;

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

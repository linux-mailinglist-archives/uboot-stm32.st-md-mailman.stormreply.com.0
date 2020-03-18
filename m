Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E55271898FF
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 11:13:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAF2BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:13:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0310AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 10:13:23 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IA91x5022556; Wed, 18 Mar 2020 11:13:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=yK0TDU/BM2OHMXk4z1lwDVuxyFEBJemaIFxFn7qGDqM=;
 b=ncuMlha5rzFTFY5evWW0bUaYhwD1nvF+DyMuYPUaEwdYvYWKeX6np3BPrZa+Wpjuj9WA
 otXuPXVXzV7k+47PHUsFFlWLl6xbQWcVHXT078tNVNQBbStIBnhQte2cnCWnb4LIOV7S
 xsIYbsK+FMJeeb0j37C3M/mir5uHy26QstJY8dlqqWtU6a9oRkkCkCj1mlcBIes6fb1t
 XLk/jA56W6upod6pKgVtW234x1LIq1JfMQmcsTh02c3PpF0zvtmWqpGpF9e6gjnNgEap
 NMR82t8WLzuQ1cb/dIn9farLtsOnZAb8U13cOUpLtck/SdPEbFotf92TWLXIGgwNeoHq Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu6xdb9cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 11:13:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DC14D10002A;
 Wed, 18 Mar 2020 11:13:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D123A221007;
 Wed, 18 Mar 2020 11:13:17 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 11:13:17 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 11:13:17 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 07/10] board: stm32mp1: add finished good
 in board identifier OTP
Thread-Index: AQHV/Q3X1ArDA1anTkuZ91lHF/pXTQ==
Date: Wed, 18 Mar 2020 10:13:17 +0000
Message-ID: <f9074113-653d-9cf3-cab3-c5c766d01f50@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-8-patrick.delaunay@st.com>
In-Reply-To: <20200212183744.5309-8-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <3FFC3853B4378142821A8B2CEFA9FD33@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 07/10] board: stm32mp1: add finished good
 in board identifier OTP
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
> Update the command stboard to support the coding of OTP 59 with
> finished good:
>
> bit [31:16] (hex) => MBxxxx
> bit [15:12] (dec) => Variant CPN (1....15)
> bit [11:8]  (dec) => Revision board (index with A = 1, Z = 26)
> bit [7:4]   (dec) => Variant FG : finished good (NEW)
> bit [3:0]   (dec) => BOM (01, .... 255)
>
> the command is:
> stboard [-y] <Board> <VarCPN> <Revision> <VarFG> <BOM>
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/common/cmd_stboard.c | 31 ++++++++++++++++++++-----------
>  board/st/stm32mp1/stm32mp1.c  |  3 ++-
>  2 files changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
> index 1573e35410..3ead1edecd 100644
> --- a/board/st/common/cmd_stboard.c
> +++ b/board/st/common/cmd_stboard.c
> @@ -31,9 +31,10 @@ static bool check_stboard(u16 board)
>  
>  static void display_stboard(u32 otp)
>  {
> -	printf("Board: MB%04x Var%d Rev.%c-%02d\n",
> +	printf("Board: MB%04x Var%d.%d Rev.%c-%02d\n",
>  	       otp >> 16,
>  	       (otp >> 12) & 0xF,
> +	       (otp >> 4) & 0xF,
>  	       ((otp >> 8) & 0xF) - 1 + 'A',
>  	       otp & 0xF);
>  }
> @@ -44,14 +45,14 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
>  	int ret;
>  	u32 otp, lock;
>  	u8 revision;
> -	unsigned long board, variant, bom;
> +	unsigned long board, var_cpn, var_fg, bom;
>  	struct udevice *dev;
> -	int confirmed = argc == 6 && !strcmp(argv[1], "-y");
> +	int confirmed = argc == 7 && !strcmp(argv[1], "-y");
>  
>  	argc -= 1 + confirmed;
>  	argv += 1 + confirmed;
>  
> -	if (argc != 0 && argc != 4)
> +	if (argc != 0 && argc != 5)
>  		return CMD_RET_USAGE;
>  
>  	ret = uclass_get_device_by_driver(UCLASS_MISC,
> @@ -95,8 +96,8 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
>  		return CMD_RET_USAGE;
>  	}
>  
> -	if (strict_strtoul(argv[1], 10, &variant) < 0 ||
> -	    variant == 0 || variant > 15) {
> +	if (strict_strtoul(argv[1], 10, &var_cpn) < 0 ||
> +	    var_cpn == 0 || var_cpn > 15) {
>  		printf("argument %d invalid: %s\n", 2, argv[1]);
>  		return CMD_RET_USAGE;
>  	}
> @@ -107,13 +108,20 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
>  		return CMD_RET_USAGE;
>  	}
>  
> -	if (strict_strtoul(argv[3], 10, &bom) < 0 ||
> +	if (strict_strtoul(argv[3], 10, &var_fg) < 0 ||
> +	    var_fg > 15) {
> +		printf("argument %d invalid: %s\n", 4, argv[3]);
> +		return CMD_RET_USAGE;
> +	}
> +
> +	if (strict_strtoul(argv[4], 10, &bom) < 0 ||
>  	    bom == 0 || bom > 15) {
>  		printf("argument %d invalid: %s\n", 4, argv[3]);
>  		return CMD_RET_USAGE;
>  	}
>  
> -	otp = (board << 16) | (variant << 12) | (revision << 8) | bom;
> +	otp = (board << 16) | (var_cpn << 12) | (revision << 8) |
> +	      (var_fg << 4) | bom;
>  	display_stboard(otp);
>  	printf("=> OTP[%d] = %08X\n", BSEC_OTP_BOARD, otp);
>  
> @@ -153,15 +161,16 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
>  	return CMD_RET_SUCCESS;
>  }
>  
> -U_BOOT_CMD(stboard, 6, 0, do_stboard,
> +U_BOOT_CMD(stboard, 7, 0, do_stboard,
>  	   "read/write board reference in OTP",
>  	   "\n"
>  	   "  Print current board information\n"
> -	   "stboard [-y] <Board> <Variant> <Revision> <BOM>\n"
> +	   "stboard [-y] <Board> <VarCPN> <Revision> <VarFG> <BOM>\n"
>  	   "  Write board information\n"
>  	   "  - Board: xxxx, example 1264 for MB1264\n"
> -	   "  - Variant: 1 ... 15\n"
> +	   "  - VarCPN: 1...15\n"
>  	   "  - Revision: A...O\n"
> +	   "  - VarFG: 0...15\n"
>  	   "  - BOM: 1...15\n");
>  
>  #endif
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index e82a43074f..76399e2d62 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -109,9 +109,10 @@ int checkboard(void)
>  		ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
>  				&otp, sizeof(otp));
>  	if (ret > 0 && otp) {
> -		printf("Board: MB%04x Var%d Rev.%c-%02d\n",
> +		printf("Board: MB%04x Var%d.%d Rev.%c-%02d\n",
>  		       otp >> 16,
>  		       (otp >> 12) & 0xF,
> +		       (otp >> 4) & 0xF,
>  		       ((otp >> 8) & 0xF) - 1 + 'A',
>  		       otp & 0xF);
>  	}

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

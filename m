Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E681A7BFE
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:11:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CAE5C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:11:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB328C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:11:31 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED3voH011479; Tue, 14 Apr 2020 15:11:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pLDlYbJyg2nNPZesJHrlVIXiciFF5OaKSeAtI/GFXA0=;
 b=GgGe02Ybp9T400D+FcVEmi31ARBKDv2PSxwUfdc4wDA62huuJ05ZugFwUlE8SqotneHN
 KMk/gLnaWRPpjonTmUvtg7kBvD6vM/AYpmW4iL+aZLszWzTSJpcGCHI0xogtN6JzUe38
 awnC3TaRJMwkBndPivB9Tx5xiV0AUcv0/BmhTN5nSEQSrqKgQtVa81l39LRv5lnf4ntQ
 RUxdSGbXqASnKlq1pARxFEZM4OToxdZvZjmcar6QKHpypOG/YEUHt6ud+qkdqqdaZUFn
 +LOX8czipUZM/jXxEN6cvPHG6YyQBK34oSVMhxtxD1qHoljUbuQOfgKfBbSPKahxifC3 YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b668dq2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:11:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA1E610002A;
 Tue, 14 Apr 2020 15:11:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F6AF2B5C26;
 Tue, 14 Apr 2020 15:11:26 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 15:11:26 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:11:26 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 17/18] stm32mp: stm32prog: support for script
Thread-Index: AQHV/P7FKSUEcEx9WEirJcREmosrpKh4oOGA
Date: Tue, 14 Apr 2020 13:11:26 +0000
Message-ID: <e0414964-4a1a-1bfc-f333-c3bfc0c09f41@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-18-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-18-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <540AEDA9970FFF4E8711F84EEF1059C8@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 17/18] stm32mp: stm32prog: support for
	script
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

Hi

On 3/18/20 9:25 AM, Patrick Delaunay wrote:
> Support an U-Boot script included in uimage instead of flashlayout file
> (text file in tsv format).
>
> This feature is used to execute this script directly when U-Boot is
> loaded in DDR (for update without STM32CubeProgrammer for example).
>
> A simple example with dfu-util only is:
>
> $> echo "dfu 0" > script.cmd
> $> mkimage -C none -A arm -T script -d script.cmd script.uimg
> $> mkimage -T stm32image -a 0xC0000000 -e 0xC0000000 -d script.uimg \
>   script.stm32
>
> $> dfu-util -d 0483:df11 -a 1 -D tf-a.stm32
> $> dfu-util -d 0483:df11 -a 0 -D script.stm32
> $> dfu-util -d 0483:df11 -a 0 -D u-boot.stm32
> $> dfu-util -d 0483:df11 -a 0 -e
>
> Then you can used dfu-utils to update your device
>
> To increase speed, you can also switch to fastboot protocol with:
>   echo "fastboot 0" > script.cmd
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  .../arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> index 15bbdc2cb6..baf9b6bd1e 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -6,6 +6,7 @@
>  #include <common.h>
>  #include <command.h>
>  #include <dfu.h>
> +#include <image.h>
>  #include <asm/arch/stm32prog.h>
>  #include "stm32prog.h"
>  
> @@ -44,6 +45,7 @@ static int do_stm32prog(cmd_tbl_t *cmdtp, int flag, int argc,
>  	int dev, ret;
>  	enum stm32prog_link_t link = LINK_UNDEFINED;
>  	bool reset = false;
> +	struct image_header_s header;
>  	struct stm32prog_data *data;
>  
>  	if (argc < 3 ||  argc > 5)
> @@ -71,6 +73,18 @@ static int do_stm32prog(cmd_tbl_t *cmdtp, int flag, int argc,
>  	if (argc > 4)
>  		size = simple_strtoul(argv[4], NULL, 16);
>  
> +	/* check STM32IMAGE presence */
> +	if (size == 0 &&
> +	    !stm32prog_header_check((struct raw_header_s *)addr, &header)) {
> +		size = header.image_length + BL_HEADER_SIZE;
> +
> +		/* uImage detected in STM32IMAGE, execute the script */
> +		if (IMAGE_FORMAT_LEGACY ==
> +		    genimg_get_format((void *)(addr + BL_HEADER_SIZE)))
> +			return image_source_script(addr + BL_HEADER_SIZE,
> +						   "script@1");
> +	}
> +
>  	enable_vidconsole();
>  
>  	data = (struct stm32prog_data *)malloc(sizeof(*data));

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

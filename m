Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 614DB294BF6
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 13:48:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28E37C3FAE0;
	Wed, 21 Oct 2020 11:48:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE4BEC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 11:48:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LBloib029391; Wed, 21 Oct 2020 13:48:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=6MSzJeQCGPRMJe/o5Lc2OHrvGlbVkCJaiDis8MkX8bw=;
 b=wwlOVjgv4xJjR71z+v1mwNInmZahUJP00dLTN5q5q6B+TY1OozGxhd+qIULV7meJQKtA
 zAKLJB/4BgtRdPXj5iu2CJZE0xOX2c7+OXauq0seYi82wB575v/0nLJ8U7eKb7PW9WF3
 ljuaRDBLj56AFB6e/ZiIIlmIdRBhKZHAn2zkqATOvMih3H1fKZUHd4sjcPiJaZjeY4/b
 NH7FuIU/FN9Lnk9tg1Cq6BR04799IFVQ3uIOneRqBsiGFTmYBS7EDpYkSgOn5/6p5aCe
 PfjxLzSRp7Wdy39XN10MOKsCYzKa0+vezMcTC8CBt/JgvCLSYpy8QYCCChZkFrLNtnBU Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347qggaam7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 13:48:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 04E2310002A;
 Wed, 21 Oct 2020 13:48:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED3452E1C36;
 Wed, 21 Oct 2020 13:48:40 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 13:48:40 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 13:48:40 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] stm32mp: stm32prog: accept device without partition
Thread-Index: AQHWou6rIbT+uP58dkm9+dytYNpLp6mh2NUA
Date: Wed, 21 Oct 2020 11:48:40 +0000
Message-ID: <77a0fb0d-799f-2c49-37dd-563cdd93aefe@st.com>
References: <20201015122817.18234-1-patrick.delaunay@st.com>
In-Reply-To: <20201015122817.18234-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <FD164B2520F0CE4BA5CBFEBA96856FC2@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: stm32prog: accept device without
	partition
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

On 10/15/20 2:28 PM, Patrick Delaunay wrote:
> When partitions are not available on a device the command stm32prog raises
> an error but a device can have no partition to check in init_device()
> and the command need to continue to the next part_id.
>
> This patch correct an issue for ram0 target, when block_dev and mtd
> are NULL.
>
> For example with the simple flashlayout file:
>
> Opt	Part	Name	Type	Device	Offset	Binary
> -	0x01	fsbl	Binary	none	0x0	tf-a-serialboot.stm32
> -	0x03	ssbl	Binary	none	0x0	u-boot.stm32
> P	0x10	kernel	System	ram0	0xC2000000	uImage.bin
> P	0x11	dtb	FileSytem	ram0	0xC4000000	stm32mp157f-ev1.dtb
>
> Fixes: ffc405e63b94 ("stm32mp: stm32prog: add upport of partial update")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index ec3355d816..a777827c55 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -768,9 +768,8 @@ static int init_device(struct stm32prog_data *data,
>  			part_found = true;
>  		}
>  
> +		/* no partition for this device */
>  		if (!part_found) {
> -			stm32prog_err("%s (0x%x): Invalid partition",
> -				      part->name, part->id);
>  			pr_debug("\n");
>  			continue;
>  		}

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

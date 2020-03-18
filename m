Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 513E218980B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:40:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13EDEC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:40:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21A49C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 09:40:04 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9cw2t007032; Wed, 18 Mar 2020 10:40:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nHyqwK145R7Pe7meFRpCPsqybpVYRUEez4IB+LbXX+M=;
 b=fNlarC8CpU6A5ZPw38ZdgJck04mlFm/20GmhYs5QUzWZPPTJ2KWONWO6hFqHPJkN8lpa
 A8MEvVhWotSp+Gmyx6wPdTU39jPCYq78cz5khMbfxHt4AWL3cJzrgwkCgpCI7fyjhUsK
 nA+UWoIjGbTJ0vsbeQ7ztgqI5JD1BLBNaZ+bhXPmljamSyaLcle1rYGJH8HPr/cJnANp
 UgsF9KTIKdttlFoTqrW9dZr2WwinXYfoK0Wga32Sj1Po6fqyJOxLaqBBf6wzYm6rBE35
 jGqTuCtbPizYIiv5QrgcMpgUYMNKvAGAGiJD1oBG13CjGd6AbgRMsqQG9RX3sZzPuKM3 sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu6xdb336-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 10:40:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 63A8710003B;
 Wed, 18 Mar 2020 10:39:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 546DF21FE99;
 Wed, 18 Mar 2020 10:39:58 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 10:39:57 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 10:39:57 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/9] ram: stm32mp1: don't display the prompt two times
Thread-Index: AQHV86AHXxUDC5Nn3EuJ5EH0Io696qhOGluA
Date: Wed, 18 Mar 2020 09:39:57 +0000
Message-ID: <8b5219e7-71a9-2940-5374-513f81b32dc7@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
 <20200306111355.3.I6004c77337da88fcc073b421245687c3f74b30a8@changeid>
In-Reply-To: <20200306111355.3.I6004c77337da88fcc073b421245687c3f74b30a8@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <DE6C4193E36D9F4FB229BBF39C1C69D5@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/9] ram: stm32mp1: don't display the
	prompt two times
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


On 3/6/20 11:14 AM, Patrick Delaunay wrote:
> Remove one "DDR>" display on command
> - next
> - step
> - go
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/ram/stm32mp1/stm32mp1_interactive.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/ram/stm32mp1/stm32mp1_interactive.c b/drivers/ram/stm32mp1/stm32mp1_interactive.c
> index cc9b2e7c96..cedf92cb5f 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_interactive.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_interactive.c
> @@ -367,7 +367,6 @@ bool stm32mp1_ddr_interactive(void *priv,
>  			      enum stm32mp1_ddr_interact_step step,
>  			      const struct stm32mp1_ddr_config *config)
>  {
> -	const char *prompt = "DDR>";
>  	char buffer[CONFIG_SYS_CBSIZE];
>  	char *argv[CONFIG_SYS_MAXARGS + 1];	/* NULL terminated */
>  	int argc;
> @@ -403,13 +402,12 @@ bool stm32mp1_ddr_interactive(void *priv,
>  	}
>  
>  	printf("%d:%s\n", step, step_str[step]);
> -	printf("%s\n", prompt);
>  
>  	if (next_step > step)
>  		return false;
>  
>  	while (next_step == step) {
> -		cli_readline_into_buffer(prompt, buffer, 0);
> +		cli_readline_into_buffer("DDR>", buffer, 0);
>  		argc = cli_simple_parse_line(buffer, argv);
>  		if (!argc)
>  			continue;

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

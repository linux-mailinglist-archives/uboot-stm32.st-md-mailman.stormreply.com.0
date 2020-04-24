Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D031B6FBE
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 10:28:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B696C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 08:28:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C2FCC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 08:28:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03O8SWZd027556; Fri, 24 Apr 2020 10:28:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=g6D3CD41Kt4qmwIaHiCTXc+JSM8dPSh95WJAWSDWn2s=;
 b=FHE6gGH8lUhdGr/kekL7ujNoEh1wjBS2g/Lx/tfJS9emO4P1VqyMr/CsdnBwm5L+yl60
 VYUb/LBQALEA2tBUnRL+e8yyIn2nuyOSVcsvwkruedc+kElnhErPOf4MxrKuiYa774jJ
 Nr4QRVwLZpkEs+3Yd7Cezp1F4ikWQpAvz0P+p8sylVuMB6v+6YuGqP9bwlJf78WnKsc0
 PlEXlJ7QlzAA2fnjS2eGjpNCEFj+gr4WddSsKHrqcedL1jzJkzpEZCO2LzzIorO60tSK
 7lZeWseeVGY+K5gE4b7kCfj6vTa01TlHvp/3Qn1eCBZaGbag8txxkWTsoGRAT8dTOuH3 Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fpp9adur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 10:28:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2574410002A;
 Fri, 24 Apr 2020 10:28:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C5782A8A81;
 Fri, 24 Apr 2020 10:28:40 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 10:28:39 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 24 Apr 2020 10:28:39 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Wolfgang Denk <wd@denx.de>
Thread-Topic: [PATCH 06/16] arm: stm32mp: spl: display error in board_init_f
Thread-Index: AQHWB3Ygtp+ajZQQTEW4+qouBTH5mahkAWWAgB/WMGCAA1aPAIAA5IbQ
Date: Fri, 24 Apr 2020 08:28:39 +0000
Message-ID: <92814bb2899b4209a95f12ae9f2c5cef@SFHDAG6NODE3.st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.6.I41a641a07fd12da45b392920fc3407e608926396@changeid>
 <20200401113019.73B6724003E@gemini.denx.de>
 <8970fb86c1374d1999ff656c2a3272da@SFHDAG6NODE3.st.com>
 <20200423203934.B536F2439C9@gemini.denx.de>
In-Reply-To: <20200423203934.B536F2439C9@gemini.denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_02:2020-04-23,
 2020-04-24 signatures=0
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 06/16] arm: stm32mp: spl: display error in
	board_init_f
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

Dear Wolfgang,

> From: Wolfgang Denk <wd@denx.de>
> Sent: jeudi 23 avril 2020 22:40
> 
> Dear Patrick,
> 
> In message <8970fb86c1374d1999ff656c2a3272da@SFHDAG6NODE3.st.com>
> you wrote:
> >

[...]

> > > >  	/* enable console uart printing */
> > > >  	preloader_console_init();
> > > >
> > > > +	if (clk || reset || pinctrl)
> > > > +		printf("%s: probe failed clk=%d reset=%d pinctrl=%d\n",
> > > > +		       __func__, clk, reset, pinctrl);
> > > > +
> > >
> > > This change makes little sense to me/  If you want error messages,
> > > then just turn above debug() into printf(), and be done with it.
> > > As an additional benefit so see at once which step failed.
> >
> > In this patch, I try to display error as soon as console is available
> > (after preloader_console_init) , if after one driver initialization
> > (clk, reset, pincontrol) failing.
> >
> > Change debug to printf only works only if CONFIG_DEBUG_UART is
> > activated (not by default) and board_debug_uart_init() exist to
> > configure the needed UART TX pins.
> 
> Maybe you can remember an error code so you can tell the user which of the steps
> failed? That would be more useful, then.

After check, I agree with you first comment.

Because console over serial can work only if the driver required for uart driver (clk, reset, pincontrol) can probe.

So CONFIG_DEBUG_UART is mandatory to identify the  failing step and debug() is enough in this case.

In fact my initial issue was only the simple return (and SPL boot continue) 
when a error was detected: I replace them by hang() calls.

That simplify the implementation in V2:
 
[PATCH v2 02/12] arm: stm32mp: spl: update error management in board_init_f
http://patchwork.ozlabs.org/project/uboot/patch/20200422142834.v2.2.I703cbd885066981e3bab374021d5578dce7cb035@changeid/

Regards
 
 
> Best regards,
> 
> Wolfgang Denk
> 
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
> I know engineers. They love to change things.             - Dr. McCoy

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

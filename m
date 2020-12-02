Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CDB2CBF11
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 15:08:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F30F6C06150;
	Wed,  2 Dec 2020 14:08:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D89C5C424C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 14:08:19 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B2E34aV022607; Wed, 2 Dec 2020 15:08:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=CoC12VUzexk8Ichx+fSZuCnLx1yup0aLKvq3JgMMEfw=;
 b=Wxt99yC/fn/jsFGEaONipmTrCsXtXH2xlksoqek/iQn/H/yBa4EpSSL5pXMKSCgGeJzO
 cphHBQ3N6x9MoTRv4JrHwP3kpL29AwH08CU+pWAHIckmrQgWOoPolIxuMHURZgwnO19F
 B7tVjakpA1jEsX1pkkS/AwgmSh8KNvw4wbA6sHdnn8uea+RoTABxpf9uImGybgBSNjgF
 IgaLvEoURHiWNI5C8IhYsMyE94J8U18taos+H86I5GzVyw5a3GFEMqL2TVyCP4U9jUtY
 QZhDvBoiqFPnxP611kDjb7XiATueQ1lrL5AVlq08zyA7R4RZH3PSmO5yLHAiOKr+YiJE Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3e3m6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 15:08:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 87B86100111;
 Wed,  2 Dec 2020 14:54:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7772B2249CE;
 Wed,  2 Dec 2020 14:54:09 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec
 2020 14:54:09 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 2 Dec 2020 14:54:09 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH 2/2] console: sandbox: remove unnecessary sandbox code
Thread-Index: AQHWxKsAY8YZe+DWukyxLlPsbiLGPqnhEBKAgAK+lkA=
Date: Wed, 2 Dec 2020 13:54:09 +0000
Message-ID: <1606917178506.76711@st.com>
References: <20201127104930.32692-1-patrick.delaunay@st.com>
 <20201127114927.2.Ida70f4fb1524187703e9240d63e436f8ae5adaab@changeid>
 <CAPnjgZ10epegATj3mBvjh0uLchyt9jGzAPt0KaF=NJ2FVNQHBQ@mail.gmail.com>
In-Reply-To: <CAPnjgZ10epegATj3mBvjh0uLchyt9jGzAPt0KaF=NJ2FVNQHBQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_06:2020-11-30,
 2020-12-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] console: sandbox: remove unnecessary
	sandbox code
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

Hi Simon,

> From: Simon Glass <sjg@chromium.org>
> Sent: lundi 30 novembre 2020 21:12
> 
> Hi Patrick,
> 
> On Fri, 27 Nov 2020 at 03:49, Patrick Delaunay <patrick.delaunay@st.com>
> wrote:
> >
> > Remove the specific sandbox code in console.c, as the config
> > CONFIG_DEBUG_UART is already supported in drivers/serial/sandbox.c and
> > activated by default in all sandbox defconfig
> > (CONFIG_DEBUG_UART_SANDBOX=y and CONFIG_DEBUG_UART=y).
> >
> > This patch allows to test the console code under DEBUG_UART in sandbox
> > and avoids to include the file <os.h> in this u-boot generic code.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  common/console.c | 15 ---------------
> >  1 file changed, 15 deletions(-)
> 
> Please see this commit as to why I put that code back, after removing it myself.
> 
> 64e9b4f346f Revert "sandbox: Drop special case console code for sandbox"
>
> Regards,
> Simon

Thanks to point it, I miss this old commit.

I don't understood the issue in the commit message:

    Revert "sandbox: Drop special case console code for sandbox"
    
    While sandbox works OK without the special-case code, it does result in
    console output being stored in the pre-console buffer while sandbox starts
    up. If there is a crash or a problem then there is no indication of what
    is going on.
    
    For ease of debugging it seems better to revert this change also.

the existing code (here for putc, but it is the same for puts)  is:  

#ifdef CONFIG_SANDBOX
	/* sandbox can send characters to stdout before it has a console */
	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
		os_putc(c);
		return;
	}
#endif
#ifdef CONFIG_DEBUG_UART
	/* if we don't have a console yet, use the debug UART */
	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
		printch(c);
		return;
	}
#endif

For sandbox, when CONFIG_DEBUG_UART is activated
    printch => _printch => _debug_uart_putc => os_putc

For me these 2 code block are identical for sandbox when CONFIG_DEBUG_UART

And the  issue described is also solved by CONFIG_DEBUG_UART=y
(consle no use preconsole buffer when serial driver s not ready).

Your concern  is when sandbox is compiled without CONFIG_DEBUG_UART ?

Because it is no more the case with my previous patch (I activate it in sandbox*defconfig) 

but to avoid issue in futur (new sandbox*defconfig) it should be better to select (or imply)
his feature for sandbox  arch in Kconfig and not more activate it in sandbox*defconfig ?

PS: with this sandox code, I don't see how to test the pre console buffer in sandbox...
       I think that the pre console buffer is alway empty for sandbox



Regards,
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

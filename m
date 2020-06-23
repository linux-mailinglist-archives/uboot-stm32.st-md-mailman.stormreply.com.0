Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C767320535D
	for <lists+uboot-stm32@lfdr.de>; Tue, 23 Jun 2020 15:25:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B0BFC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 23 Jun 2020 13:25:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79F53C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2020 13:25:36 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05NDJmva009929; Tue, 23 Jun 2020 15:25:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=fhqIUctdW/g4PWcPt3loxtoTR6rtxwZX7FLwbreLTXA=;
 b=kLsjPCs6ZPd0euBAEK63wsXSZm66ORFlgoneQeknh4LW2yafSOnnc1lb0hnIt3rHz7Eh
 JdCUKEfm4t7wnlllRtcLlA0m800kMrQYYkZTW+M8UQYvWCSAWl6Y7vnoBBza9AlX/Kio
 EtAIAmVkawoJdiQJfydyGpd60VJWssBh0xBdJs1xbVgicBkjtH7+HpVaJLjLe646lv9M
 303tUvhhFefaQGhScQkT13M7bj+hkY4l0+Q5Ghrx6wJcRptr6cfgj9srERX48XSwDQ07
 oi18IPS+YEAGCLS747KMb+DiRnYtyNM27bzPsLOJGXqBWvU2yJlS/Lg0p1tNwQKqeKJj Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31s87vfepu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 15:25:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 207E910002A;
 Tue, 23 Jun 2020 15:25:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 13E782C51BF;
 Tue, 23 Jun 2020 15:25:31 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 23 Jun
 2020 15:25:30 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 23 Jun 2020 15:25:30 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Stephen Warren <swarren@wwwdotorg.org>
Thread-Topic: [RESEND PATCH v5 4/4] test: env: add test for env info
 sub-command
Thread-Index: AQHWRjGwOUr8IJHrHkaYAuIaCsv90ajk3h8AgAFYK6A=
Date: Tue, 23 Jun 2020 13:25:30 +0000
Message-ID: <7288c055b63149ce9b9c97035915f57c@SFHDAG6NODE3.st.com>
References: <20200619120337.17042-1-patrick.delaunay@st.com>
 <20200619120337.17042-5-patrick.delaunay@st.com>
 <fe00c944-0f54-8c61-ee16-dc97844eba44@wwwdotorg.org>
In-Reply-To: <fe00c944-0f54-8c61-ee16-dc97844eba44@wwwdotorg.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_06:2020-06-23,
 2020-06-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Stephen Warren <swarren@nvidia.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH v5 4/4] test: env: add test for env
 info sub-command
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

Hi Stephen,

> From: Stephen Warren <swarren@wwwdotorg.org>
> Sent: lundi 22 juin 2020 20:51
> 
> On 6/19/20 6:03 AM, Patrick Delaunay wrote:
> > Add a pytest for testing the env info sub-command:
> >
> > test_env_info: test command with several option that can be executed
> > on real hardware device without assumption
> >
> > test_env_info_sandbox: test the result on sandbox with a known ENV
> > configuration: ready & default & persistent
> >
> > The quiet option '-q' is used for support in shell test; for example:
> >   if env info -p -d -q; then env save; fi
> 
> Acked-by: Stephen Warren <swarren@nvidia.com>

Thanks

 
> > +def test_env_info(state_test_env):
> ...
> > +    for l in response.split('\n'):
> > +        if 'env_valid = ' in l:
> > +            assert '= invalid' in l or '= valid' in l or '= redundant' in l
> > +            nb_line += 1
> > +        elif 'env_ready =' in l or 'env_use_default =' in l:
> > +            assert '= true' in l or '= false' in l
> > +            nb_line += 1
> > +        else:
> > +            assert true
> 
> Those last two lines don't seem terribly useful:-)

Not really,
beacuse I add the nb_line check,
this first check can be removed.

Do expect a V6 just for that?

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

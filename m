Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D5A205A0F
	for <lists+uboot-stm32@lfdr.de>; Tue, 23 Jun 2020 20:00:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F298FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 23 Jun 2020 18:00:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5666EC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2020 18:00:17 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05NHk4Cb022508; Tue, 23 Jun 2020 20:00:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=VOaUJX9KGTj7LowfGJPIu/GJYnS004bRV0qk3SWKx/A=;
 b=V769bAE6xK4/+ZX0RdCNZE56ogAoPGQQRPbnFz9l8H4iVdYu1YFKQ10XMoXXaH565+CE
 2MIX/v/HA4+em+u0UWu4z4iHhxtiaE8JvVoYmMUYVi82RgfxbuWgco9BrmlVZRL7Q2/+
 LYHvd7J5pvI79WrCmPufjUYYQy/KY6fsAa49RRCayRI/VbGpQzBx+cmtu0GywrFhpMio
 STX5tee3uezfHNhq6A2MDXJR6tzFLtakv4MuG2vgNnydBk267sV3OzplIp/2NOZf4hHq
 i5bV5Hj9ieJ9QnfePmH1fB1pps42Mo/LkWf2xwqI0GDiGTMbQKOElZauTrZ1kR6ryIpo EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uk0p1130-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 20:00:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 21E5410002A;
 Tue, 23 Jun 2020 20:00:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0022F2CDB62;
 Tue, 23 Jun 2020 20:00:00 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 23 Jun
 2020 20:00:00 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 23 Jun 2020 20:00:00 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Stephen Warren <swarren@wwwdotorg.org>
Thread-Topic: [PATCH v2 6/9] test: environment in ext4
Thread-Index: AQHWQ7F3SZznAYgujkyH9yVno9Lu4Kjk5PmAgAGSOfA=
Date: Tue, 23 Jun 2020 18:00:00 +0000
Message-ID: <df73ba36ab4b44ae90f4b17716b34257@SFHDAG6NODE3.st.com>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-7-patrick.delaunay@st.com>
 <cd2bf3ca-661f-b67f-39a7-dcc804d70882@wwwdotorg.org>
In-Reply-To: <cd2bf3ca-661f-b67f-39a7-dcc804d70882@wwwdotorg.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_11:2020-06-23,
 2020-06-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Stephen Warren <swarren@nvidia.com>
Subject: Re: [Uboot-stm32] [PATCH v2 6/9] test: environment in ext4
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

Hi,

> From: Stephen Warren <swarren@wwwdotorg.org>
> Sent: lundi 22 juin 2020 20:57
> 
> On 6/16/20 1:40 AM, Patrick Delaunay wrote:
> > Add basic test to persistent environment in ext4:
> > save and load in host ext4 file 'uboot.env'.
> >
> > On first execution an empty EXT4 file system is created in persistent
> > data dir: env.ext4.img.
> 
> > diff --git a/test/py/tests/test_env.py b/test/py/tests/test_env.py
> 
> > +def mk_env_ext4(state_test_env):
> 
> > +    if os.path.exists(persistent):
> > +        c.log.action('Disk image file ' + persistent + ' already exists')
> > +    else:
> > +        try:
> > +            check_call('rm -f %s' % persistent, shell=True)
> 
> This should be run with the results logged to the overall test log file so that if there
> are failures, it's possible to see what they were. Use
> util.run_and_log() for this.

Ok, I will modifiy this part (I copy ext4 file create is copied form py/tests/test_fs/conftest.py:166 mk_fs() )

> Also, this particular command doesn't seem useful, since 4 lines above the code
> verified that the file doesn't exist.

Yes not needed, I remove this line.

> > +@pytest.mark.boardspec('sandbox')
> > +@pytest.mark.buildconfigspec('cmd_nvedit_info')
> > +@pytest.mark.buildconfigspec('cmd_echo')
> > +@pytest.mark.buildconfigspec('env_is_in_ext4')
> > +def test_env_ext4(state_test_env):
> > +
> > +    c = state_test_env.u_boot_console
> 
> Nit: That blank line is a bit odd.

OK
 
> > +    fs_img = mk_env_ext4(state_test_env)
> > +    c.run_command('host bind 0  %s' % fs_img)
> > +
> > +    response = c.run_command('ext4ls host 0:0')
> > +    assert 'uboot.env' not in response
> > +
> > +    """ env location: ENVL_EXT4 (2)
> > +    """
> 
> Nit: Wrap the trailing """ onto the same line; no need to force it to be a multi-line
> string. Also a comman may be better rather than a docstring. Same for the other
> docstring later.

OK, I don't realized that it was docstring.
 
> > +    call('rm -f %s' % fs_img, shell=True)
> 
> This won't happen if the test fails earlier. Should there be a try/except block or
> wrapper function with exception handling to resolve this?

Yes, I add it for V3

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

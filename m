Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ABF356596
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Apr 2021 09:40:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12600C56639;
	Wed,  7 Apr 2021 07:40:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1AD6C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Apr 2021 07:40:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1377bIjP026031; Wed, 7 Apr 2021 09:40:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oTGZsW8KKz7K/d2aXPDXYF6Mmf/EjL1aCpKlDbz16iE=;
 b=q1vr/2pmR4EEHRBJTYgxVjdvzuBmgkXs4DVxR2wXj4OhIexABXNuonF/K60VoQjRynBS
 S1sVjcdlVRtJtGxuYvKQHMxX3Q34T9i1Z39K1W1uNZa6aLz6oOP1wGXhzf+bP7g0n+Yz
 NXNJsn7iHSepzDAExJCYTK2QeIyMNXh/mIKmZSGFc5Bq9LT6SmbABVPTf90aapl6EtYp
 VLpCy26FxY/N0h4Em+HVT39RbzmNH9m+P0WODlNkrNtv7p7i2IVY9A0roXg6OcVc48Q3
 FDOUSm/tJR+TiJgGHhnEuMUWYleCrfEuJhmzDrg3tXk9gaCgcW4x0DmGPNxmcTqPVEoo zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37rvaab6eq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 09:40:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D7B2C10002A;
 Wed,  7 Apr 2021 09:40:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BBA9521A8BA;
 Wed,  7 Apr 2021 09:40:08 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Apr
 2021 09:40:07 +0200
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
References: <20210406093755.1.I94f875f95a48be081d332f9a2c447c0b78955e75@changeid>
 <20210406091456.r724uooghf7mo65p@soft-dev3-1.localhost>
Message-ID: <4f9babe6-36cf-a321-deeb-fca0a8e541e7@foss.st.com>
Date: Wed, 7 Apr 2021 09:40:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406091456.r724uooghf7mo65p@soft-dev3-1.localhost>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-07_04:2021-04-06,
 2021-04-07 signatures=0
Cc: Joe Hershberger <joe.hershberger@ni.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Etienne Carriere <etienne.carriere@linaro.org>,
 Lars Povlsen <lars.povlsen@microchip.com>
Subject: Re: [Uboot-stm32] [PATCH] dm: core: Add address translation in
	fdt_get_resource
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgSG9yYXRpdSwKCk9uIDQvNi8yMSAxMToxNCBBTSwgSG9yYXRpdSBWdWx0dXIgd3JvdGU6Cj4g
VGhlIDA0LzA2LzIwMjEgMDk6MzgsIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4KPiBIaSBQYXRy
aWNrLAo+Cj4gSSBoYXZlIGFwcGxpZWQgeW91ciBwYXRjaGVzIGFuZCBJIGhhdmUgZG9uZSBhIGJh
c2ljIHRlc3Qgb24ganIyX3N3aXRjaC4KPiBJdCBzZWVtcyB0byB3b3JrIGZpbmUuIEkgZ290IHNv
bWUgd2FybmluZ3MgZnJvbSB0aGUgZnVuY3Rpb24KPiAnX19vZl90cmFuc2xhdGVfYWRkcmVzcycg
d2hpY2ggSSBuZWVkIHRvIGZpZ3VyZSBvdXQuCj4KPiBCdXQgb25lIG1vcmUgaW1wb3J0YW50IHRo
aW5nIGlzIHRoYXQgYWxzbyBsdXRvbl9zd2l0Y2ggc2hvdWxkIGJlCj4gdXBkYXRlZC4KCgpUaGFu
a3MgZm9yIHRoZSB0ZXN0cwoKSSBtaXNzICdsdXRvbl9zd2l0Y2gnIGltcGFjdCwgSSB3aWxsIGFk
ZCBpdCBpbiBWMi4KCgpmb3IgaW5mb3JtYXRpb246CgpJIGNoZWNrIGFnYWluIGFsbCB0aGUgdXNl
cjoKCiQ+IGdyZXAgLXIgb2Zub2RlX3JlYWRfcmVzb3VyY2UgKiB8IGN1dCAtZiAxwqAgLWQ6IHwg
eGFyZ3MKCiQ+IGdyZXAgdHJhbnNsYXRlCgpJIGRvbid0IGZvdW5kIGFueSBvdGhlciBkcml2ZXIg
d2hpY2ggdXNlIHRyYW5zbGF0ZSBhbmQgZ2V0IHJlc3NvdXJjZS4KCgpSZWdhcmRzCgpQYXRyaWNr
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK

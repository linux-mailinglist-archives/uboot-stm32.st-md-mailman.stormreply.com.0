Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A995B9ECE
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Sep 2022 17:30:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 575C8C0D2BB;
	Thu, 15 Sep 2022 15:30:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21331C03FE0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 15:30:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FAnXte009079;
 Thu, 15 Sep 2022 17:30:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=EcifS3eRiDcFvZE+lS2mrnsb9XWMmnWwvRXresDk4qs=;
 b=iMNtfkOSzrgsxqZCqa1JX3lbRg9RdraDHMrJtmtKtgcCxXXkfpZTm4a7YCToY3yLr7z2
 O7HYNYNZBXILo9QM2vT8e1epa6IcFW0M8vN42ROMG2pPJQtrfhT0KqSZ0XK2Svn66PHD
 NTaFeL98XjNS8UPTJ8a0b1s5+BK6OO8SeorJ0Y64uXWf9MM9cD9chrS3VMnZeR4JZu18
 ojAd7D2FCXxSFHN5xXcH1pIOQJTtCfHPeyej2FyPznPEhfUTri+2BFUF1KnzWoWU50BC
 p2k7MlI2DuZ+gbZRP4u5AUCYCMw+btfBKm4cgUmmPqeaQ7e8Gk0UYnAwqEV3NSkTS6Vp xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jjxxaxd9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Sep 2022 17:30:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 97F9210002A;
 Thu, 15 Sep 2022 17:30:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 91E08231DF2;
 Thu, 15 Sep 2022 17:30:48 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.48) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 15 Sep
 2022 17:30:45 +0200
Message-ID: <e4018b69-329c-4fd2-daf1-6b44d3a8216f@foss.st.com>
Date: Thu, 15 Sep 2022 17:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20220912084201.1826979-1-alain.volmat@foss.st.com>
 <20220912084201.1826979-4-alain.volmat@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220912084201.1826979-4-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
Cc: oleksandr.suvorov@foundries.io, hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v4 3/4] i2c: stm32: do not set the STOP
	condition on error
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

SGkgQWxhaW4sCgpPbiA5LzEyLzIyIDEwOjQyLCBBbGFpbiBWb2xtYXQgd3JvdGU6Cj4gQ3VycmVu
dCBmdW5jdGlvbiBzdG0zMl9pMmNfbWVzc2FnZV94ZmVyIGlzIHNlbmRpbmcgYSBTVE9QCj4gd2hh
dGV2ZXIgdGhlIHJlc3VsdCBvZiB0aGUgdHJhbnNhY3Rpb24gaXMuICBUaGlzIGNhbiBjYXVzZSBp
c3N1ZXMKPiBzdWNoIGFzIG1ha2luZyB0aGUgYnVzIGJ1c3kgc2luY2UgdGhlIGNvbnRyb2xsZXIg
aXRzZWxmIGlzIGFscmVhZHkKPiBzZW5kaW5nIGF1dG9tYXRpY2FsbHkgYSBTVE9QIHdoZW4gYSBO
QUNLIGlzIGdlbmVyYXRlZC4KPgo+IFRoYW5rcyB0byBKb3JnZSBSYW1pcmV6LU9ydGl6IGZvciBk
aWFnbm9zaW5nIGFuZCBwcm9wb3NpbmcgYSBmaXJzdAo+IGZpeCBmb3IgdGhpcy4gWzFdCj4KPiBb
MV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdS1ib290LzIwMjIwODE1MTQ1MjExLjMxMzQyLTIt
am9yZ2VAZm91bmRyaWVzLmlvLwo+Cj4gUmVwb3J0ZWQtYnk6IEpvcmdlIFJhbWlyZXotT3J0aXos
IEZvdW5kcmllcyA8am9yZ2VAZm91bmRyaWVzLmlvPgo+IFNpZ25lZC1vZmYtYnk6IEpvcmdlIFJh
bWlyZXotT3J0aXogPGpvcmdlQGZvdW5kcmllcy5pbz4KPiBTaWduZWQtb2ZmLWJ5OiBBbGFpbiBW
b2xtYXQgPGFsYWluLnZvbG1hdEBmb3NzLnN0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvaTJjL3N0
bTMyZjdfaTJjLmMgfCA2ICsrKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9zdG0zMmY3X2ky
Yy5jIGIvZHJpdmVycy9pMmMvc3RtMzJmN19pMmMuYwo+IGluZGV4IDBlYzY3YjVjMTIuLjJkYjdm
NDRkNDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pMmMvc3RtMzJmN19pMmMuYwo+ICsrKyBiL2Ry
aXZlcnMvaTJjL3N0bTMyZjdfaTJjLmMKPiBAQCAtNDgzLDkgKzQ4Myw5IEBAIHN0YXRpYyBpbnQg
c3RtMzJfaTJjX21lc3NhZ2VfeGZlcihzdHJ1Y3Qgc3RtMzJfaTJjX3ByaXYgKmkyY19wcml2LAo+
ICAgCQl9Cj4gICAJfQo+ICAgCj4gLQkvKiBFbmQgb2YgdHJhbnNmZXIsIHNlbmQgc3RvcCBjb25k
aXRpb24gKi8KPiAtCW1hc2sgPSBTVE0zMl9JMkNfQ1IyX1NUT1A7Cj4gLQlzZXRiaXRzX2xlMzIo
JnJlZ3MtPmNyMiwgbWFzayk7Cj4gKwkvKiBFbmQgb2YgdHJhbnNmZXIsIHNlbmQgc3RvcCBjb25k
aXRpb24gaWYgYXBwcm9wcmlhdGUgKi8KPiArCWlmICghcmV0ICYmICEoc3RhdHVzICYgKFNUTTMy
X0kyQ19JU1JfTkFDS0YgfCBTVE0zMl9JMkNfSVNSX0VSUk9SUykpKQo+ICsJCXNldGJpdHNfbGUz
MigmcmVncy0+Y3IyLCBTVE0zMl9JMkNfQ1IyX1NUT1ApOwo+ICAgCj4gICAJcmV0dXJuIHN0bTMy
X2kyY19jaGVja19lbmRfb2ZfbWVzc2FnZShpMmNfcHJpdik7Cj4gICB9CgoKQXBwbGllZCB0byB1
LWJvb3Qtc3RtL21hc3RlciwgdGhhbmtzIQoKSSBhbHNvIGFkZCB0aGUgbWlzc2luZyBSZXZpZXdl
ZC1ieSB3aGVuIEkgZ2V0IHRoZSBwYXRjaCBmcm9tIHBhdGNod29yawoKaHR0cDovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvdWJvb3QvcGF0Y2gvMjAyMjA5MTIwODQyMDEuMTgyNjk3OS01
LWFsYWluLnZvbG1hdEBmb3NzLnN0LmNvbS8KCivCoCBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90
YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+CivCoCBSZXZpZXdlZC1ieTogSGVpa28g
U2Nob2NoZXIgPGhzQGRlbnguZGU+CivCoCBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8
cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KK8KgIFRlc3RlZC1ieTogUGF0cmljayBEZWxh
dW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KClJlZ2FyZHMKUGF0cmljawoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMy
IG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290
LXN0bTMyCg==
